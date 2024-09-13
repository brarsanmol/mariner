defmodule Engine.OCIDescriptor do
  @moduledoc """
  Provides struct and type for a OCIDescriptor
  """

  @type t :: %__MODULE__{
          digest: String.t() | nil,
          mediaType: String.t() | nil,
          size: integer | nil
        }

  defstruct [:digest, :mediaType, :size]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [digest: {:string, :generic}, mediaType: {:string, :generic}, size: :integer]
  end
end
