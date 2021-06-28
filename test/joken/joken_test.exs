defmodule JokenTest do
  use ExUnit.Case

  test "can generate a JWT token, sign it, and verify it" do
    signer = Joken.Signer.create("HS256", "secret")

    extra_claims = %{"user_id" => "some_id"}
    token_with_default_plus_custom_claims = Joken.Token.generate_and_sign!(extra_claims, signer)

    {:ok, claims} = Joken.Token.verify_and_validate(token_with_default_plus_custom_claims, signer)

    assert claims["aud"] == "Joken"
    assert claims["iss"] == "Joken"

    # Using <= because it might take a fraction of second to compute `now`.
    assert claims["exp"] <= from_now_as_unix(2)
    assert claims["iat"] <= DateTime.utc_now() |> DateTime.to_unix()

    assert claims["nbf"] == assert(claims["iat"])

    assert claims["user_id"] == "some_id"

    # The `claim["jti"]` is something generated via generate_jti, whose output changes randomly.
    # I tried to modify the default using Joken.Config.default_claims(jti: fn -> "my_jti" end)
    # but didn't work. What worked (but I didn't like) was to just add it to the claims so as to
    # overwrite it:
    # extra_claims = %{"user_id" => "some_id", jti: "my_jti"}
  end

  defp from_now_as_unix(hours) do
    DateTime.utc_now() |> DateTime.add(hours * 60 * 60) |> DateTime.to_unix()
  end
end
