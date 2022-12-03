# frozen_string_literal: true

module Visible
  extend ActiveSupport::Concern

  VALID_STATUSES = %w[public private archived].freeze

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  class_methods do
    def public_count
      where(status: "public").count
    end

    def status_public
      "public"
    end

    def status_private
      "private"
    end

    def status_archived
      "archived"
    end
  end

  def archived?
    status == "archived"
  end
end
