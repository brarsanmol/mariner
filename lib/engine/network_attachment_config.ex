defmodule Engine.NetworkAttachmentConfig do
  @moduledoc """
  Provides struct and type for a NetworkAttachmentConfig
  """

  @type t :: %__MODULE__{
          Aliases: [String.t()] | nil,
          DriverOpts: Engine.NetworkAttachmentConfigDriverOpts.t() | nil,
          Target: String.t() | nil
        }

  defstruct [:Aliases, :DriverOpts, :Target]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Aliases: [string: :generic],
      DriverOpts: {Engine.NetworkAttachmentConfigDriverOpts, :t},
      Target: {:string, :generic}
    ]
  end
end
