defmodule Rxchange.Transaction_addons do
  @moduledoc """
  The Transaction_addons context.
  """

  import Ecto.Query, warn: false
  alias Rxchange.Repo

  alias Rxchange.Transaction_addons.Addon

  @doc """
  Returns the list of addons.

  ## Examples

      iex> list_addons()
      [%Addon{}, ...]

  """
  def list_addons do
    Repo.all(Addon)
  end

  @doc """
  Gets a single addon.

  Raises `Ecto.NoResultsError` if the Addon does not exist.

  ## Examples

      iex> get_addon!(123)
      %Addon{}

      iex> get_addon!(456)
      ** (Ecto.NoResultsError)

  """
  def get_addon!(id), do: Repo.get!(Addon, id)

  @doc """
  Creates a addon.

  ## Examples

      iex> create_addon(%{field: value})
      {:ok, %Addon{}}

      iex> create_addon(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_addon(attrs \\ %{}) do
    %Addon{}
    |> Addon.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a addon.

  ## Examples

      iex> update_addon(addon, %{field: new_value})
      {:ok, %Addon{}}

      iex> update_addon(addon, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_addon(%Addon{} = addon, attrs) do
    addon
    |> Addon.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a addon.

  ## Examples

      iex> delete_addon(addon)
      {:ok, %Addon{}}

      iex> delete_addon(addon)
      {:error, %Ecto.Changeset{}}

  """
  def delete_addon(%Addon{} = addon) do
    Repo.delete(addon)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking addon changes.

  ## Examples

      iex> change_addon(addon)
      %Ecto.Changeset{data: %Addon{}}

  """
  def change_addon(%Addon{} = addon, attrs \\ %{}) do
    Addon.changeset(addon, attrs)
  end
end
