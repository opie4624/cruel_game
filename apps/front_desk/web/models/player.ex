defmodule FrontDesk.Player do
  use FrontDesk.Web, :model

  schema "players" do
    field :email, :string
    field :handle, :string
    field :phone, :string
    field :crypted_password, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :handle, :phone, :crypted_password])
    |> validate_required([:email, :handle, :phone, :crypted_password])
    |> unique_constraint(:email)
    |> unique_constraint(:handle)
    |> unique_constraint(:phone)
  end
end
