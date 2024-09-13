defmodule Engine.TaskSpecResources do
  @moduledoc """
  Provides struct and type for a TaskSpecResources
  """

  @type t :: %__MODULE__{
          Limits: Engine.Limit.t() | nil,
          Reservations: Engine.ResourceObject.t() | nil
        }

  defstruct [:Limits, :Reservations]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Limits: {Engine.Limit, :t}, Reservations: {Engine.ResourceObject, :t}]
  end
end
