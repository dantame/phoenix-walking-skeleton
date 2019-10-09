defmodule WalkingSkeletonWeb.PowEmailConfirmation.MailerView do
  use WalkingSkeletonWeb, :mailer_view

  def subject(:email_confirmation, _assigns), do: "Confirm your email address"
end
