defmodule Engine.NodeSpec do
  @moduledoc """
  Provides struct and type for a NodeSpec
  """

  @type t :: %__MODULE__{
          Availability: String.t() | nil,
          Labels: Engine.NodeSpecLabels.t() | nil,
          Name: String.t() | nil,
          Role: String.t() | nil
        }

  defstruct [:Availability, :Labels, :Name, :Role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Availability: {:enum, ["active", "pause", "drain"]},
      Labels: {Engine.NodeSpecLabels, :t},
      Name: {:string, :generic},
      Role: {:enum, ["worker", "manager"]}
    ]
  end
end
