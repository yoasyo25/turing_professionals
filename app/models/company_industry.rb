class CompanyIndustry < ApplicationRecord
  belongs_to :company
  belongs_to :industry
  has_many :tech_stacks, :foreign_key => "company_id", :class_name => "TechStack"

  validates_presence_of :company_id, :industry_id
end
