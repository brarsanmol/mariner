defmodule Engine.DeviceRequest do
  @moduledoc """
  Provides struct and type for a DeviceRequest
  """

  @type t :: %__MODULE__{
          Capabilities: [[String.t()]] | nil,
          Count: integer | nil,
          DeviceIDs: [String.t()] | nil,
          Driver: String.t() | nil,
          Options: Engine.DeviceRequestOptions.t() | nil
        }

  defstruct [:Capabilities, :Count, :DeviceIDs, :Driver, :Options]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Capabilities: [[string: :generic]],
      Count: :integer,
      DeviceIDs: [string: :generic],
      Driver: {:string, :generic},
      Options: {Engine.DeviceRequestOptions, :t}
    ]
  end
end
