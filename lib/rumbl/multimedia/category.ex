defmodule Rumbl.Multimedia.Category do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  alias Rumbl.Multimedia.Video

  schema "categories" do
    field :name, :string
    has_many :videos, Video

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> no_assoc_constraint(:videos,
      message: "category still has associated videos"
    )
  end

  @spec alphabetical(Ecto.Query.t()) :: Ecto.Query.t()
  def alphabetical(query) do
    from c in query, order_by: c.name
  end
end
