defmodule Engine.DeviceMapping do
  @moduledoc """
  Provides struct and type for a DeviceMapping
  """

  @type t :: %__MODULE__{
          CgroupPermissions: String.t() | nil,
          PathInContainer: String.t() | nil,
          PathOnHost: String.t() | nil
        }

  defstruct [:CgroupPermissions, :PathInContainer, :PathOnHost]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      CgroupPermissions: {:string, :generic},
      PathInContainer: {:string, :generic},
      PathOnHost: {:string, :generic}
    ]
  end
end
