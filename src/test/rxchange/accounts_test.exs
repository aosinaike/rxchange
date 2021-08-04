defmodule Rxchange.AccountsTest do
  use Rxchange.DataCase

  alias Rxchange.Accounts

  describe "users" do
    alias Rxchange.Accounts.User

    @valid_attrs %{country: "some country", email: "some email", first_name: "some first_name", last_name: "some last_name", locked_until_date: "some locked_until_date", no_of_login_attempt: 42, password: "some password", phone_number: "some phone_number", status: "some status", user_type: "some user_type", username: "some username"}
    @update_attrs %{country: "some updated country", email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name", locked_until_date: "some updated locked_until_date", no_of_login_attempt: 43, password: "some updated password", phone_number: "some updated phone_number", status: "some updated status", user_type: "some updated user_type", username: "some updated username"}
    @invalid_attrs %{country: nil, email: nil, first_name: nil, last_name: nil, locked_until_date: nil, no_of_login_attempt: nil, password: nil, phone_number: nil, status: nil, user_type: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.country == "some country"
      assert user.email == "some email"
      assert user.first_name == "some first_name"
      assert user.last_name == "some last_name"
      assert user.locked_until_date == "some locked_until_date"
      assert user.no_of_login_attempt == 42
      assert user.password == "some password"
      assert user.phone_number == "some phone_number"
      assert user.status == "some status"
      assert user.user_type == "some user_type"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.country == "some updated country"
      assert user.email == "some updated email"
      assert user.first_name == "some updated first_name"
      assert user.last_name == "some updated last_name"
      assert user.locked_until_date == "some updated locked_until_date"
      assert user.no_of_login_attempt == 43
      assert user.password == "some updated password"
      assert user.phone_number == "some updated phone_number"
      assert user.status == "some updated status"
      assert user.user_type == "some updated user_type"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
