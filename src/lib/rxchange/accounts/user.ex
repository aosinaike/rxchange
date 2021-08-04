defmodule Rxchange.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :country, :string
    field :email, :string, unique: true
    field :first_name, :string
    field :last_name, :string
    field :locked_until_date, :string
    field :no_of_login_attempt, :integer
    field(:password, :string, virtual: true)
    field(:password_hash, :string)
    field :phone_number, :string, unique: true
    field :status, :string
    field :user_type, :string
    field :username, :string, unique: true

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:phone_number, :username, :password, :first_name, :last_name, :email, :no_of_login_attempt, :locked_until_date, :user_type, :country, :status])
    |> validate_required([:phone_number, :username, :password, :first_name, :last_name, :email, :no_of_login_attempt, :user_type, :country])
    |>unique_constraint(:unique_user_constraint, name: :unique_user)
    |>validate_format(:email,~r/@/)
    |>update_change(:email, &String.downcase(&1))
    |> validate_length(:password, min: 5, max: 20)
    # |> unique_constraint(:email, downcase: true)
    |> put_password_hash()
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
  
      _ ->
        changeset
    end
  end
end
