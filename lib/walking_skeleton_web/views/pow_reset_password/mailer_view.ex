defmodule WalkingSkeletonWeb.PowResetPassword.MailerView do
  use WalkingSkeletonWeb, :mailer_view

  def subject(:reset_password, _assigns), do: "Reset password link"
end
