defmodule Engine.EndpointPortConfig do
  @moduledoc """
  Provides struct and type for a EndpointPortConfig
  """

  @type t :: %__MODULE__{
          Name: String.t() | nil,
          Protocol: String.t() | nil,
          PublishMode: String.t() | nil,
          PublishedPort: integer | nil,
          TargetPort: integer | nil
        }

  defstruct [:Name, :Protocol, :PublishMode, :PublishedPort, :TargetPort]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Name: {:string, :generic},
      Protocol: {:enum, ["tcp", "udp", "sctp"]},
      PublishMode: {:enum, ["ingress", "host"]},
      PublishedPort: :integer,
      TargetPort: :integer
    ]
  end
end
