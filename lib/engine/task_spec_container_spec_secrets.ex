defmodule Engine.TaskSpecContainerSpecSecrets do
  @moduledoc """
  Provides struct and type for a TaskSpecContainerSpecSecrets
  """

  @type t :: %__MODULE__{
          File: Engine.TaskSpecContainerSpecSecretsFile.t() | nil,
          SecretID: String.t() | nil,
          SecretName: String.t() | nil
        }

  defstruct [:File, :SecretID, :SecretName]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      File: {Engine.TaskSpecContainerSpecSecretsFile, :t},
      SecretID: {:string, :generic},
      SecretName: {:string, :generic}
    ]
  end
end
