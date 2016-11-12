defmodule FrontDesk.Game do
  use FrontDesk.Web, :model

  schema "games" do
    field :start, Ecto.DateTime
    field :end, Ecto.DateTime
    field :location, :string
    belongs_to :player, FrontDesk.Player

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:start, :end, :location])
    |> validate_required([:start, :end, :location])
  end
end
