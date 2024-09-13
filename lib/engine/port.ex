defmodule Engine.Port do
  @moduledoc """
  Provides struct and type for a Port
  """

  @type t :: %__MODULE__{
          IP: String.t() | nil,
          PrivatePort: integer,
          PublicPort: integer | nil,
          Type: String.t()
        }

  defstruct [:IP, :PrivatePort, :PublicPort, :Type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      IP: {:string, :generic},
      PrivatePort: :integer,
      PublicPort: :integer,
      Type: {:enum, ["tcp", "udp", "sctp"]}
    ]
  end
end
