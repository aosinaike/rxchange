defmodule Rxchange.Repo.Migrations.CreateTransactions do
  use Ecto.Migration

  def change do
    create table(:transactions) do
      add :source, :string
      add :destination, :string
      add :tran_type, :integer
      add :network, :integer
      add :service_type, :integer
      add :date, :string
      add :status, :string

      timestamps()
    end

  end
end
