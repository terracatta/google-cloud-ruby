# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/security_center/v1/security_marks.proto


require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.cloud.securitycenter.v1.SecurityMarks" do
    optional :name, :string, 1
    map :marks, :string, :string, 2
  end
end

module Google::Cloud::SecurityCenter::V1
  SecurityMarks = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.securitycenter.v1.SecurityMarks").msgclass
end