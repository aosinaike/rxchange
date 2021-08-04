defmodule Rxchange.Transactions.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transactions" do
    field :date, :string
    field :destination, :string
    field :network, :integer
    field :service_type, :integer
    field :source, :string
    field :status, :string
    field :tran_type, :integer

    timestamps()
  end

  @doc false
  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:source, :destination, :tran_type, :network, :service_type, :date, :status])
    |> validate_required([:source, :destination, :tran_type, :network, :service_type, :date, :status])
  end
end
