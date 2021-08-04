defmodule Rxchange.Transaction_addons.Addon do
  use Ecto.Schema
  import Ecto.Changeset

  schema "addons" do
    field :bonus, :string
    field :charge_category, :string
    field :charge_type, :integer
    field :charge_value, :string
    field :service_type, :string
    field :source, :string
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(addon, attrs) do
    addon
    |> cast(attrs, [:charge_value, :charge_type, :charge_category, :source, :bonus, :service_type, :status])
    |> validate_required([:charge_value, :charge_type, :charge_category, :source, :bonus, :service_type, :status])
  end
end
