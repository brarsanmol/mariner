defmodule Engine.ThrottleDevice do
  @moduledoc """
  Provides struct and type for a ThrottleDevice
  """

  @type t :: %__MODULE__{Path: String.t() | nil, Rate: integer | nil}

  defstruct [:Path, :Rate]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Path: {:string, :generic}, Rate: :integer]
  end
end
