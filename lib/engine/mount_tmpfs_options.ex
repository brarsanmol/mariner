defmodule Engine.MountTmpfsOptions do
  @moduledoc """
  Provides struct and type for a MountTmpfsOptions
  """

  @type t :: %__MODULE__{
          Mode: integer | nil,
          Options: [[String.t()]] | nil,
          SizeBytes: integer | nil
        }

  defstruct [:Mode, :Options, :SizeBytes]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Mode: :integer, Options: [[string: :generic]], SizeBytes: :integer]
  end
end
