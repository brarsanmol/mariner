defmodule Engine.TaskSpecContainerSpecConfigsFile do
  @moduledoc """
  Provides struct and type for a TaskSpecContainerSpecConfigsFile
  """

  @type t :: %__MODULE__{
          GID: String.t() | nil,
          Mode: integer | nil,
          Name: String.t() | nil,
          UID: String.t() | nil
        }

  defstruct [:GID, :Mode, :Name, :UID]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      GID: {:string, :generic},
      Mode: :integer,
      Name: {:string, :generic},
      UID: {:string, :generic}
    ]
  end
end
