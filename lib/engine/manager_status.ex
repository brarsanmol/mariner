defmodule Engine.ManagerStatus do
  @moduledoc """
  Provides struct and type for a ManagerStatus
  """

  @type t :: %__MODULE__{
          Addr: String.t() | nil,
          Leader: boolean | nil,
          Reachability: String.t() | nil
        }

  defstruct [:Addr, :Leader, :Reachability]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Addr: {:string, :generic},
      Leader: :boolean,
      Reachability: {:enum, ["unknown", "unreachable", "reachable"]}
    ]
  end
end
