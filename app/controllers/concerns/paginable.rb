# frozen_string_literal: true

module Paginable
  extend ActiveSupport::Concern

  MAX_RECORDS_PER_PAGE = 20
  INITIAL_OFFSET = 0
  META_KEY = :pagination

  attr_reader :paginated_records, :all_records

  def paginate(records)
    @all_records = records
    @paginated_records = records.limit(limit).offset(offset)
  end

  def limit
    params[:limit]&.to_i || MAX_RECORDS_PER_PAGE
  end

  def offset
    params[:offset]&.to_i || INITIAL_OFFSET
  end

  def total_records
    @total_records ||= all_records.count
  end

  def pagination_meta
    {
      total_records: total_records,
      current_offset: current_offset,
      next_offset: next_offset,
      limit: limit,
    }
  end

  private

  def next_page?
    (offset + limit) < total_records
  end

  def current_offset
    offset
  end

  def next_offset
    offset + limit if next_page?
  end
end
