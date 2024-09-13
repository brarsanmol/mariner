defmodule Engine.EventActor do
  @moduledoc """
  Provides struct and type for a EventActor
  """

  @type t :: %__MODULE__{Attributes: Engine.EventActorAttributes.t() | nil, ID: String.t() | nil}

  defstruct [:Attributes, :ID]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Attributes: {Engine.EventActorAttributes, :t}, ID: {:string, :generic}]
  end
end
