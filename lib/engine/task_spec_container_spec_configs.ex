defmodule Engine.TaskSpecContainerSpecConfigs do
  @moduledoc """
  Provides struct and type for a TaskSpecContainerSpecConfigs
  """

  @type t :: %__MODULE__{
          ConfigID: String.t() | nil,
          ConfigName: String.t() | nil,
          File: Engine.TaskSpecContainerSpecConfigsFile.t() | nil,
          Runtime: map | nil
        }

  defstruct [:ConfigID, :ConfigName, :File, :Runtime]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ConfigID: {:string, :generic},
      ConfigName: {:string, :generic},
      File: {Engine.TaskSpecContainerSpecConfigsFile, :t},
      Runtime: :map
    ]
  end
end
