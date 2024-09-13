defmodule Engine.ContainerStatus do
  @moduledoc """
  Provides struct and type for a ContainerStatus
  """

  @type t :: %__MODULE__{
          ContainerID: String.t() | nil,
          ExitCode: integer | nil,
          PID: integer | nil
        }

  defstruct [:ContainerID, :ExitCode, :PID]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [ContainerID: {:string, :generic}, ExitCode: :integer, PID: :integer]
  end
end
