# frozen_string_literal: true

RSpec.shared_examples "a not found request" do
  let(:id) { -1 }

  it "returns a not found (404) status code" do
    expect(response.status).to eq(404)
  end

  it "returns a not found error message" do
    expect(json_error).to eq I18n.t("not_found")
  end
end

RSpec.shared_examples "a bad request" do
  it "returns a bad request (400) status code" do
    expect(response.status).to eq(400)
  end
end

RSpec.shared_examples "a failed create" do
  it "returns an unprocessable entity (422) status code" do
    expect(response.status).to eq(422)
  end
end

RSpec.shared_examples "a response with nested errors" do
  it "returns the error messages" do
    expect(json_response[:errors][:error]).to eq(error)
  end
end

RSpec.shared_examples "a response with errors" do
  it "returns the error messages" do
    expect(json_response[:errors]).to eq(errors)
  end
end

RSpec.shared_examples "a response with an error" do
  it "returns the error message" do
    expect(json_response[:error]).to eq(error)
  end
end

RSpec.shared_examples "a show request with a root" do |root|
  it_behaves_like "a successful request"

  it "returns the specified item" do
    expect(json_response[root][:id]).to eq(id)
  end
end

RSpec.shared_examples "a show request" do
  it_behaves_like "a successful request"

  it "returns the specified item" do
    expect(json_response[:id]).to eq(id)
  end
end

RSpec.shared_examples "a successful request" do
  it "returns an OK (200) status code" do
    expect(response.status).to eq(200)
  end
end

RSpec.shared_examples "an authenticated request" do
  before { get path }

  it "does not allow non-logged in users" do
    expect(response.status).to eq 401
  end

  it "returns acccess denied error" do
    expect(json_error).to eq "Access denied"
  end
end
