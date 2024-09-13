defmodule Engine.TaskSpecContainerSpecPrivilegesCredentialSpec do
  @moduledoc """
  Provides struct and type for a TaskSpecContainerSpecPrivilegesCredentialSpec
  """

  @type t :: %__MODULE__{
          Config: String.t() | nil,
          File: String.t() | nil,
          Registry: String.t() | nil
        }

  defstruct [:Config, :File, :Registry]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Config: {:string, :generic}, File: {:string, :generic}, Registry: {:string, :generic}]
  end
end
