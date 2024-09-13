defmodule Engine.TaskSpecContainerSpecDNSConfig do
  @moduledoc """
  Provides struct and type for a TaskSpecContainerSpecDNSConfig
  """

  @type t :: %__MODULE__{
          Nameservers: [String.t()] | nil,
          Options: [String.t()] | nil,
          Search: [String.t()] | nil
        }

  defstruct [:Nameservers, :Options, :Search]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Nameservers: [string: :generic], Options: [string: :generic], Search: [string: :generic]]
  end
end
