defmodule Engine.SwarmSpecCAConfig do
  @moduledoc """
  Provides struct and type for a SwarmSpecCAConfig
  """

  @type t :: %__MODULE__{
          ExternalCAs: [Engine.SwarmSpecCAConfigExternalCAs.t()] | nil,
          ForceRotate: integer | nil,
          NodeCertExpiry: integer | nil,
          SigningCACert: String.t() | nil,
          SigningCAKey: String.t() | nil
        }

  defstruct [:ExternalCAs, :ForceRotate, :NodeCertExpiry, :SigningCACert, :SigningCAKey]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ExternalCAs: [{Engine.SwarmSpecCAConfigExternalCAs, :t}],
      ForceRotate: :integer,
      NodeCertExpiry: :integer,
      SigningCACert: {:string, :generic},
      SigningCAKey: {:string, :generic}
    ]
  end
end
