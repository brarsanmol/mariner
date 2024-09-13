defmodule Engine.TaskSpecContainerSpecPrivilegesSELinuxContext do
  @moduledoc """
  Provides struct and type for a TaskSpecContainerSpecPrivilegesSELinuxContext
  """

  @type t :: %__MODULE__{
          Disable: boolean | nil,
          Level: String.t() | nil,
          Role: String.t() | nil,
          Type: String.t() | nil,
          User: String.t() | nil
        }

  defstruct [:Disable, :Level, :Role, :Type, :User]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Disable: :boolean,
      Level: {:string, :generic},
      Role: {:string, :generic},
      Type: {:string, :generic},
      User: {:string, :generic}
    ]
  end
end
