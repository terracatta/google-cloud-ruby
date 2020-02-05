# frozen_string_literal: true

# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "minitest/autorun"

require "gapic/grpc/service_stub"

require "google/cloud/billing/v1/cloud_billing_pb"
require "google/cloud/billing/v1/cloud_billing_services_pb"
require "google/cloud/billing/v1/cloud_billing"

class Google::Cloud::Billing::V1::CloudBilling::ClientTest < Minitest::Test
  class ClientStub
    attr_accessor :call_rpc_count, :requests

    def initialize response, operation, &block
      @response = response
      @operation = operation
      @block = block
      @call_rpc_count = 0
      @requests = []
    end

    def call_rpc *args
      @call_rpc_count += 1

      @requests << @block&.call(*args)

      yield @response, @operation if block_given?

      @response
    end
  end

  def test_get_billing_account
    # Create GRPC objects.
    grpc_response = Google::Cloud::Billing::V1::BillingAccount.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_billing_account_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_billing_account, name
      assert_kind_of Google::Cloud::Billing::V1::GetBillingAccountRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_billing_account_client_stub do
      # Create client
      client = Google::Cloud::Billing::V1::CloudBilling::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_billing_account({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_billing_account name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_billing_account Google::Cloud::Billing::V1::GetBillingAccountRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_billing_account({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_billing_account Google::Cloud::Billing::V1::GetBillingAccountRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_billing_account_client_stub.call_rpc_count
    end
  end

  def test_list_billing_accounts
    # Create GRPC objects.
    grpc_response = Google::Cloud::Billing::V1::ListBillingAccountsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    page_size = 42
    page_token = "hello world"
    filter = "hello world"

    list_billing_accounts_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_billing_accounts, name
      assert_kind_of Google::Cloud::Billing::V1::ListBillingAccountsRequest, request
      assert_equal 42, request.page_size
      assert_equal "hello world", request.page_token
      assert_equal "hello world", request.filter
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_billing_accounts_client_stub do
      # Create client
      client = Google::Cloud::Billing::V1::CloudBilling::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_billing_accounts({ page_size: page_size, page_token: page_token, filter: filter }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_billing_accounts page_size: page_size, page_token: page_token, filter: filter do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_billing_accounts Google::Cloud::Billing::V1::ListBillingAccountsRequest.new(page_size: page_size, page_token: page_token, filter: filter) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_billing_accounts({ page_size: page_size, page_token: page_token, filter: filter }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_billing_accounts Google::Cloud::Billing::V1::ListBillingAccountsRequest.new(page_size: page_size, page_token: page_token, filter: filter), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_billing_accounts_client_stub.call_rpc_count
    end
  end

  def test_update_billing_account
    # Create GRPC objects.
    grpc_response = Google::Cloud::Billing::V1::BillingAccount.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"
    account = {}
    update_mask = {}

    update_billing_account_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :update_billing_account, name
      assert_kind_of Google::Cloud::Billing::V1::UpdateBillingAccountRequest, request
      assert_equal "hello world", request.name
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Billing::V1::BillingAccount), request.account
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::FieldMask), request.update_mask
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, update_billing_account_client_stub do
      # Create client
      client = Google::Cloud::Billing::V1::CloudBilling::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.update_billing_account({ name: name, account: account, update_mask: update_mask }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.update_billing_account name: name, account: account, update_mask: update_mask do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.update_billing_account Google::Cloud::Billing::V1::UpdateBillingAccountRequest.new(name: name, account: account, update_mask: update_mask) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.update_billing_account({ name: name, account: account, update_mask: update_mask }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.update_billing_account Google::Cloud::Billing::V1::UpdateBillingAccountRequest.new(name: name, account: account, update_mask: update_mask), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, update_billing_account_client_stub.call_rpc_count
    end
  end

  def test_create_billing_account
    # Create GRPC objects.
    grpc_response = Google::Cloud::Billing::V1::BillingAccount.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    billing_account = {}

    create_billing_account_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :create_billing_account, name
      assert_kind_of Google::Cloud::Billing::V1::CreateBillingAccountRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Billing::V1::BillingAccount), request.billing_account
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, create_billing_account_client_stub do
      # Create client
      client = Google::Cloud::Billing::V1::CloudBilling::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.create_billing_account({ billing_account: billing_account }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.create_billing_account billing_account: billing_account do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.create_billing_account Google::Cloud::Billing::V1::CreateBillingAccountRequest.new(billing_account: billing_account) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.create_billing_account({ billing_account: billing_account }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.create_billing_account Google::Cloud::Billing::V1::CreateBillingAccountRequest.new(billing_account: billing_account), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, create_billing_account_client_stub.call_rpc_count
    end
  end

  def test_list_project_billing_info
    # Create GRPC objects.
    grpc_response = Google::Cloud::Billing::V1::ListProjectBillingInfoResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"
    page_size = 42
    page_token = "hello world"

    list_project_billing_info_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_project_billing_info, name
      assert_kind_of Google::Cloud::Billing::V1::ListProjectBillingInfoRequest, request
      assert_equal "hello world", request.name
      assert_equal 42, request.page_size
      assert_equal "hello world", request.page_token
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_project_billing_info_client_stub do
      # Create client
      client = Google::Cloud::Billing::V1::CloudBilling::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_project_billing_info({ name: name, page_size: page_size, page_token: page_token }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_project_billing_info name: name, page_size: page_size, page_token: page_token do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_project_billing_info Google::Cloud::Billing::V1::ListProjectBillingInfoRequest.new(name: name, page_size: page_size, page_token: page_token) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_project_billing_info({ name: name, page_size: page_size, page_token: page_token }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_project_billing_info Google::Cloud::Billing::V1::ListProjectBillingInfoRequest.new(name: name, page_size: page_size, page_token: page_token), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_project_billing_info_client_stub.call_rpc_count
    end
  end

  def test_get_project_billing_info
    # Create GRPC objects.
    grpc_response = Google::Cloud::Billing::V1::ProjectBillingInfo.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_project_billing_info_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_project_billing_info, name
      assert_kind_of Google::Cloud::Billing::V1::GetProjectBillingInfoRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_project_billing_info_client_stub do
      # Create client
      client = Google::Cloud::Billing::V1::CloudBilling::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_project_billing_info({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_project_billing_info name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_project_billing_info Google::Cloud::Billing::V1::GetProjectBillingInfoRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_project_billing_info({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_project_billing_info Google::Cloud::Billing::V1::GetProjectBillingInfoRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_project_billing_info_client_stub.call_rpc_count
    end
  end

  def test_update_project_billing_info
    # Create GRPC objects.
    grpc_response = Google::Cloud::Billing::V1::ProjectBillingInfo.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"
    project_billing_info = {}

    update_project_billing_info_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :update_project_billing_info, name
      assert_kind_of Google::Cloud::Billing::V1::UpdateProjectBillingInfoRequest, request
      assert_equal "hello world", request.name
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Billing::V1::ProjectBillingInfo), request.project_billing_info
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, update_project_billing_info_client_stub do
      # Create client
      client = Google::Cloud::Billing::V1::CloudBilling::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.update_project_billing_info({ name: name, project_billing_info: project_billing_info }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.update_project_billing_info name: name, project_billing_info: project_billing_info do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.update_project_billing_info Google::Cloud::Billing::V1::UpdateProjectBillingInfoRequest.new(name: name, project_billing_info: project_billing_info) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.update_project_billing_info({ name: name, project_billing_info: project_billing_info }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.update_project_billing_info Google::Cloud::Billing::V1::UpdateProjectBillingInfoRequest.new(name: name, project_billing_info: project_billing_info), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, update_project_billing_info_client_stub.call_rpc_count
    end
  end

  def test_get_iam_policy
    # Create GRPC objects.
    grpc_response = Google::Iam::V1::Policy.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    resource = "hello world"

    get_iam_policy_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_iam_policy, name
      assert_kind_of Google::Iam::V1::GetIamPolicyRequest, request
      assert_equal "hello world", request.resource
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_iam_policy_client_stub do
      # Create client
      client = Google::Cloud::Billing::V1::CloudBilling::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_iam_policy({ resource: resource }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_iam_policy resource: resource do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_iam_policy Google::Iam::V1::GetIamPolicyRequest.new(resource: resource) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_iam_policy({ resource: resource }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_iam_policy Google::Iam::V1::GetIamPolicyRequest.new(resource: resource), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_iam_policy_client_stub.call_rpc_count
    end
  end

  def test_set_iam_policy
    # Create GRPC objects.
    grpc_response = Google::Iam::V1::Policy.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    resource = "hello world"
    policy = {}

    set_iam_policy_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :set_iam_policy, name
      assert_kind_of Google::Iam::V1::SetIamPolicyRequest, request
      assert_equal "hello world", request.resource
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Iam::V1::Policy), request.policy
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, set_iam_policy_client_stub do
      # Create client
      client = Google::Cloud::Billing::V1::CloudBilling::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.set_iam_policy({ resource: resource, policy: policy }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.set_iam_policy resource: resource, policy: policy do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.set_iam_policy Google::Iam::V1::SetIamPolicyRequest.new(resource: resource, policy: policy) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.set_iam_policy({ resource: resource, policy: policy }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.set_iam_policy Google::Iam::V1::SetIamPolicyRequest.new(resource: resource, policy: policy), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, set_iam_policy_client_stub.call_rpc_count
    end
  end

  def test_test_iam_permissions
    # Create GRPC objects.
    grpc_response = Google::Iam::V1::TestIamPermissionsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    resource = "hello world"
    permissions = ["hello world"]

    test_iam_permissions_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :test_iam_permissions, name
      assert_kind_of Google::Iam::V1::TestIamPermissionsRequest, request
      assert_equal "hello world", request.resource
      assert_equal ["hello world"], request.permissions
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, test_iam_permissions_client_stub do
      # Create client
      client = Google::Cloud::Billing::V1::CloudBilling::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.test_iam_permissions({ resource: resource, permissions: permissions }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.test_iam_permissions resource: resource, permissions: permissions do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.test_iam_permissions Google::Iam::V1::TestIamPermissionsRequest.new(resource: resource, permissions: permissions) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.test_iam_permissions({ resource: resource, permissions: permissions }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.test_iam_permissions Google::Iam::V1::TestIamPermissionsRequest.new(resource: resource, permissions: permissions), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, test_iam_permissions_client_stub.call_rpc_count
    end
  end
end