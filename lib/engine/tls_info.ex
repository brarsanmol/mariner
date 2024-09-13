defmodule Engine.TLSInfo do
  @moduledoc """
  Provides struct and type for a TLSInfo
  """

  @type t :: %__MODULE__{
          CertIssuerPublicKey: String.t() | nil,
          CertIssuerSubject: String.t() | nil,
          TrustRoot: String.t() | nil
        }

  defstruct [:CertIssuerPublicKey, :CertIssuerSubject, :TrustRoot]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      CertIssuerPublicKey: {:string, :generic},
      CertIssuerSubject: {:string, :generic},
      TrustRoot: {:string, :generic}
    ]
  end
end
