defmodule Rxchange.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :phone_number, :string
      add :username, :string
      add :password, :string
      add :first_name, :string
      add :last_name, :string
      add :email, :string
      add :no_of_login_attempt, :integer
      add :locked_until_date, :string
      add :user_type, :string
      add :country, :string
      add :status, :string

      timestamps()
    end

  end
end
