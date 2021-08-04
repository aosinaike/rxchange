defmodule Rxchange.Repo.Migrations.CreateAddons do
  use Ecto.Migration

  def change do
    create table(:addons) do
      add :charge_value, :string
      add :charge_type, :integer
      add :charge_category, :string
      add :source, :string
      add :bonus, :string
      add :service_type, :string
      add :status, :string

      timestamps()
    end

  end
end
