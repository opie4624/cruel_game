defmodule FrontDesk.Player do
  use FrontDesk.Web, :model

  schema "players" do
    field :email, :string
    field :handle, :string
    field :phone, :string
    field :crypted_password, :string
    field :password, :string, virtual: true
    has_many :games, Game

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :handle, :phone, :password])
    |> validate_required([:email, :handle, :phone, :password])
    |> unique_constraint(:email)
    |> unique_constraint(:handle)
    |> unique_constraint(:phone)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 5)
  end
end
