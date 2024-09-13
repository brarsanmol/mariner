defmodule Engine.NodeDescription do
  @moduledoc """
  Provides struct and type for a NodeDescription
  """

  @type t :: %__MODULE__{
          Engine: Engine.EngineDescription.t() | nil,
          Hostname: String.t() | nil,
          Platform: Engine.Platform.t() | nil,
          Resources: Engine.ResourceObject.t() | nil,
          TLSInfo: Engine.TLSInfo.t() | nil
        }

  defstruct [:Engine, :Hostname, :Platform, :Resources, :TLSInfo]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Engine: {Engine.EngineDescription, :t},
      Hostname: {:string, :generic},
      Platform: {Engine.Platform, :t},
      Resources: {Engine.ResourceObject, :t},
      TLSInfo: {Engine.TLSInfo, :t}
    ]
  end
end
