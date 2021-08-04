defmodule Rxchange.Transaction_addonsTest do
  use Rxchange.DataCase

  alias Rxchange.Transaction_addons

  describe "addons" do
    alias Rxchange.Transaction_addons.Addon

    @valid_attrs %{bonus: "some bonus", charge_category: "some charge_category", charge_type: 42, charge_value: "some charge_value", service_type: "some service_type", source: "some source", status: "some status"}
    @update_attrs %{bonus: "some updated bonus", charge_category: "some updated charge_category", charge_type: 43, charge_value: "some updated charge_value", service_type: "some updated service_type", source: "some updated source", status: "some updated status"}
    @invalid_attrs %{bonus: nil, charge_category: nil, charge_type: nil, charge_value: nil, service_type: nil, source: nil, status: nil}

    def addon_fixture(attrs \\ %{}) do
      {:ok, addon} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Transaction_addons.create_addon()

      addon
    end

    test "list_addons/0 returns all addons" do
      addon = addon_fixture()
      assert Transaction_addons.list_addons() == [addon]
    end

    test "get_addon!/1 returns the addon with given id" do
      addon = addon_fixture()
      assert Transaction_addons.get_addon!(addon.id) == addon
    end

    test "create_addon/1 with valid data creates a addon" do
      assert {:ok, %Addon{} = addon} = Transaction_addons.create_addon(@valid_attrs)
      assert addon.bonus == "some bonus"
      assert addon.charge_category == "some charge_category"
      assert addon.charge_type == 42
      assert addon.charge_value == "some charge_value"
      assert addon.service_type == "some service_type"
      assert addon.source == "some source"
      assert addon.status == "some status"
    end

    test "create_addon/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transaction_addons.create_addon(@invalid_attrs)
    end

    test "update_addon/2 with valid data updates the addon" do
      addon = addon_fixture()
      assert {:ok, %Addon{} = addon} = Transaction_addons.update_addon(addon, @update_attrs)
      assert addon.bonus == "some updated bonus"
      assert addon.charge_category == "some updated charge_category"
      assert addon.charge_type == 43
      assert addon.charge_value == "some updated charge_value"
      assert addon.service_type == "some updated service_type"
      assert addon.source == "some updated source"
      assert addon.status == "some updated status"
    end

    test "update_addon/2 with invalid data returns error changeset" do
      addon = addon_fixture()
      assert {:error, %Ecto.Changeset{}} = Transaction_addons.update_addon(addon, @invalid_attrs)
      assert addon == Transaction_addons.get_addon!(addon.id)
    end

    test "delete_addon/1 deletes the addon" do
      addon = addon_fixture()
      assert {:ok, %Addon{}} = Transaction_addons.delete_addon(addon)
      assert_raise Ecto.NoResultsError, fn -> Transaction_addons.get_addon!(addon.id) end
    end

    test "change_addon/1 returns a addon changeset" do
      addon = addon_fixture()
      assert %Ecto.Changeset{} = Transaction_addons.change_addon(addon)
    end
  end
end
