defmodule RxchangeWeb.Api.Schema do
  use Absinthe.Schema
  alias Rxchange.Accounts
  alias Rxchange.TransactionAddOn
  alias Rxchange.Transactions
  alias RxchangeWeb.Resolvers

  object :user do
    field :id, non_null(:id)
    field :country, non_null(:string)
    field :email, non_null(:string)
    field :first_name, non_null(:string)
    field :last_name, non_null(:string)
    field :password, non_null(:string)
    field :phone_number,non_null(:string)
    field :user_type, non_null(:string)
    field :username, non_null(:string)
    field :no_of_login_attempt, non_null(:integer)
    field :locked_until_date, :string
    field :status, non_null(:string)
  end

  input_object :user_input do
    field :username, :string
    field :password, :string
    field :user_type, :string
    field :last_name, :string
    field :first_name, :string
    field :email, :string
    field :country, :string
    field :phone_number, :string
    field :locked_until_date, :string
    field :no_of_login_attempt, :integer
    field :status, :string
  end


  object :transaction do
    field :id, non_null(:id)
    field :source, non_null(:string)
    field :destination, non_null(:string)
    field :tran_type, non_null(:integer)
    field :network, non_null(:integer)
    field :service_type, non_null(:integer)
    field :date,non_null(:string)
    field :status, non_null(:string)
  end

  input_object :transaction_input do
    field :source, :string
    field :destination, :string
    field :tran_type, :integer
    field :network, :integer
    field :service_type, :integer
    field :date, :string
    field :status, :string
  end

  object :transactionAddOn do
    field :id, non_null(:id)
    field :charge_value, non_null(:string)
    field :charge_type, non_null(:integer)
    field :charge_category, non_null(:integer)
    field :source, non_null(:string)
    field :bonus, non_null(:string)
    field :service_type,non_null(:integer)
    field :status, non_null(:string)
  end

  input_object :transactionAddOn_input do
    field :charge_value, :string
    field :charge_type, :integer
    field :charge_category, :integer
    field :source, :string
    field :bonus, :string
    field :service_type, :integer
    field :status, :string
  end

  mutation do
    field :create_user, type: :user do
      arg(:user, non_null(:user_input))
      # resolve (fn %{user: user}, _ ->
      #   case Rxchange_res.create_user(%{user: user}) do
      #     {:ok, %Accounts.User{}} ->
      #       {:ok, true}
      #     _->
      #       {:ok,false}
      #   end
      # end)
      resolve (&Resolvers.UserResolvers.register_user/3)
    end
  end

  query do
    field :hello, :string do
      resolve(fn _, _ ->
        {:ok, "Hello World"}
      end)
    end

    field :users, non_null(list_of(:user)) do
      resolve(fn _, _ ->
        {:ok, Accounts.list_users()}
      end)
    end

    field :transactions, non_null(list_of(:transaction)) do
      resolve(fn _, _ ->
        {:ok, Transactions.list_transactions()}
      end)
    end

    field :transactionAddOns, non_null(list_of(:transactionAddOn)) do
      resolve(fn _, _ ->
        {:ok, TransactionAddOns.list_addons()}
      end)
    end
  end




end
