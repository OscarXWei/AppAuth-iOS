/*! @file OIDTokenRequestTests.m
    @brief AppAuth iOS SDK
    @copyright
        Copyright 2015 Google Inc. All Rights Reserved.
    @copydetails
        Licensed under the Apache License, Version 2.0 (the "License");
        you may not use this file except in compliance with the License.
        You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

        Unless required by applicable law or agreed to in writing, software
        distributed under the License is distributed on an "AS IS" BASIS,
        WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
        See the License for the specific language governing permissions and
        limitations under the License.
 */

#import "OIDTokenRequestTests.h"

#import "OIDAuthorizationResponseTests.h"
#import "OIDServiceConfigurationTests.h"

#if SWIFT_PACKAGE
@import AppAuthCore;
#else
#import "Sources/AppAuthCore/OIDAuthorizationRequest.h"
#import "Sources/AppAuthCore/OIDAuthorizationResponse.h"
#import "Sources/AppAuthCore/OIDScopeUtilities.h"
#import "Sources/AppAuthCore/OIDServiceConfiguration.h"
#import "Sources/AppAuthCore/OIDTokenRequest.h"
#endif

// Ignore warnings about "Use of GNU statement expression extension" which is raised by our use of
// the XCTAssert___ macros.
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wgnu"

/*! @brief Test value for the @c refreshToken property.
 */
static NSString *const kRefreshTokenTestValue = @"refresh_token";

/*! @brief Test key for the @c additionalParameters property.
 */
static NSString *const kTestAdditionalParameterKey = @"A";

/*! @brief Test value for the @c additionalParameters property.
 */
static NSString *const kTestAdditionalParameterValue = @"1";

/*! @brief Test key for the @c additionalHeaders property.
 */
static NSString *const kTestAdditionalHeaderKey = @"B";

/*! @brief Test value for the @c additionalHeaders property.
 */
static NSString *const kTestAdditionalHeaderValue = @"2";

/*! @brief Test key for the @c additionalHeaders property.
 */
static NSString *const kTestAdditionalHeaderKey2 = @"C";

/*! @brief Test value for the @c additionalHeaders property.
 */
static NSString *const kTestAdditionalHeaderValue2 = @"3";

@implementation OIDTokenRequestTests

+ (OIDTokenRequest *)testInstance {
  OIDAuthorizationResponse *authResponse = [OIDAuthorizationResponseTests testInstance];
  NSArray<NSString *> *scopesArray =
      [OIDScopeUtilities scopesArrayWithString:authResponse.request.scope];
  NSDictionary *additionalParameters =
      @{ kTestAdditionalParameterKey : kTestAdditionalParameterValue };
  NSDictionary *additionalHeaders =
      @{ kTestAdditionalHeaderKey : kTestAdditionalHeaderValue };
  
  OIDTokenRequest *request =
      [[OIDTokenRequest alloc] initWithConfiguration:authResponse.request.configuration
                                           grantType:OIDGrantTypeAuthorizationCode
                                   authorizationCode:authResponse.authorizationCode
                                         redirectURL:authResponse.request.redirectURL
                                            clientID:authResponse.request.clientID
                                        clientSecret:authResponse.request.clientSecret
                                              scopes:scopesArray
                                        refreshToken:kRefreshTokenTestValue
                                        codeVerifier:authResponse.request.codeVerifier
                                additionalParameters:additionalParameters
                                   additionalHeaders:additionalHeaders];
  return request;
}

+ (OIDTokenRequest *)testInstanceCodeExchange {
  OIDAuthorizationResponse *authResponse = [OIDAuthorizationResponseTests testInstanceCodeFlow];
  NSArray<NSString *> *scopesArray =
      [OIDScopeUtilities scopesArrayWithString:authResponse.request.scope];
  NSDictionary *additionalParameters =
      @{ kTestAdditionalParameterKey : kTestAdditionalParameterValue };
  NSDictionary *additionalHeaders =
      @{ kTestAdditionalHeaderKey : kTestAdditionalHeaderValue };
  
  OIDTokenRequest *request =
      [[OIDTokenRequest alloc] initWithConfiguration:authResponse.request.configuration
                                           grantType:OIDGrantTypeAuthorizationCode
                                   authorizationCode:authResponse.authorizationCode
                                         redirectURL:authResponse.request.redirectURL
                                            clientID:authResponse.request.clientID
                                        clientSecret:authResponse.request.clientSecret
                                              scopes:scopesArray
                                        refreshToken:kRefreshTokenTestValue
                                        codeVerifier:authResponse.request.codeVerifier
                                additionalParameters:additionalParameters
                                   additionalHeaders:additionalHeaders];
  return request;
}

+ (OIDTokenRequest *)testInstanceCodeExchangeClientAuth {
  OIDAuthorizationResponse *authResponse = [OIDAuthorizationResponseTests testInstanceCodeFlowClientAuth];
  NSArray<NSString *> *scopesArray =
      [OIDScopeUtilities scopesArrayWithString:authResponse.request.scope];
  NSDictionary *additionalParameters =
      @{ kTestAdditionalParameterKey : kTestAdditionalParameterValue };
  NSDictionary *additionalHeaders =
      @{ kTestAdditionalHeaderKey : kTestAdditionalHeaderValue };
  
  OIDTokenRequest *request =
      [[OIDTokenRequest alloc] initWithConfiguration:authResponse.request.configuration
                                           grantType:OIDGrantTypeAuthorizationCode
                                   authorizationCode:authResponse.authorizationCode
                                         redirectURL:authResponse.request.redirectURL
                                            clientID:authResponse.request.clientID
                                        clientSecret:authResponse.request.clientSecret
                                              scopes:scopesArray
                                        refreshToken:kRefreshTokenTestValue
                                        codeVerifier:authResponse.request.codeVerifier
                                additionalParameters:additionalParameters
                                   additionalHeaders:additionalHeaders];
  return request;
}

+ (OIDTokenRequest *)testInstanceRefresh {
  OIDAuthorizationResponse *authResponse = [OIDAuthorizationResponseTests testInstance];
  NSArray<NSString *> *scopesArray =
      [OIDScopeUtilities scopesArrayWithString:authResponse.request.scope];
  NSDictionary *additionalParameters =
      @{ kTestAdditionalParameterKey : kTestAdditionalParameterValue };
  NSDictionary *additionalHeaders =
      @{ kTestAdditionalHeaderKey : kTestAdditionalHeaderValue };
  
  OIDTokenRequest *request =
      [[OIDTokenRequest alloc] initWithConfiguration:authResponse.request.configuration
                                           grantType:OIDGrantTypeAuthorizationCode
                                   authorizationCode:authResponse.authorizationCode
                                         redirectURL:nil
                                            clientID:authResponse.request.clientID
                                        clientSecret:authResponse.request.clientSecret
                                              scopes:scopesArray
                                        refreshToken:kRefreshTokenTestValue
                                        codeVerifier:authResponse.request.codeVerifier
                                additionalParameters:additionalParameters
                                   additionalHeaders:additionalHeaders];
  return request;
}

+ (OIDTokenRequest *)testInstanceAdditionalHeaders {
  OIDAuthorizationResponse *authResponse = [OIDAuthorizationResponseTests testInstance];
  NSArray<NSString *> *scopesArray =
      [OIDScopeUtilities scopesArrayWithString:authResponse.request.scope];
  NSDictionary *additionalParameters =
      @{ kTestAdditionalParameterKey : kTestAdditionalParameterValue };
  NSDictionary *additionalHeaders = @{
    kTestAdditionalHeaderKey : kTestAdditionalHeaderValue,
    kTestAdditionalHeaderKey2 : kTestAdditionalHeaderValue2
  };
  
  OIDTokenRequest *request =
      [[OIDTokenRequest alloc] initWithConfiguration:authResponse.request.configuration
                                           grantType:OIDGrantTypeAuthorizationCode
                                   authorizationCode:authResponse.authorizationCode
                                         redirectURL:authResponse.request.redirectURL
                                            clientID:authResponse.request.clientID
                                        clientSecret:authResponse.request.clientSecret
                                              scopes:scopesArray
                                        refreshToken:kRefreshTokenTestValue
                                        codeVerifier:authResponse.request.codeVerifier
                                additionalParameters:additionalParameters
                                   additionalHeaders:additionalHeaders];
  return request;
}

/*! @brief Tests the @c NSCopying implementation by round-tripping an instance through the copying
        process and checking to make sure the source and destination instances are equivalent.
 */
- (void)testCopying {
  OIDAuthorizationResponse *authResponse = [OIDAuthorizationResponseTests testInstance];
  OIDTokenRequest *request = [[self class] testInstance];

  XCTAssertEqualObjects(request.configuration.authorizationEndpoint,
                        authResponse.request.configuration.authorizationEndpoint,
                        @"Request and response authorization endpoints should be equal.");
  XCTAssertEqualObjects(request.grantType, OIDGrantTypeAuthorizationCode,
                        @"Request grant type should be OIDGrantTypeAuthorizationCode.");
  XCTAssertEqualObjects(request.authorizationCode, authResponse.authorizationCode,
                        @"Request and response authorization codes should be equal.");
  XCTAssertEqualObjects(request.redirectURL, authResponse.request.redirectURL,
                        @"Request and response redirectURLs should be equal.");
  XCTAssertEqualObjects(request.clientID, authResponse.request.clientID,
                        @"Request and response clientIDs should be equal.");
  XCTAssertEqualObjects(request.clientSecret, authResponse.request.clientSecret,
                        @"Request and response clientSecrets should be equal.");
  XCTAssertEqualObjects(request.scope, authResponse.request.scope,
                        @"Request and response scope values should be equal.");
  XCTAssertEqualObjects(request.refreshToken, kRefreshTokenTestValue,
                        @"Request refreshToken should be equal to kRefreshTokenTestValue.");
  XCTAssertEqualObjects(request.codeVerifier, authResponse.request.codeVerifier,
                        @"Request and response codeVerifiers should be equal.");
  XCTAssertNotNil(request.additionalParameters,
                  @"Request's additionalParameters field should not be nil.");
  XCTAssertEqualObjects(request.additionalParameters[kTestAdditionalParameterKey],
                        kTestAdditionalParameterValue,
                        @"The request's kTestAdditionalParameterKey additional parameter should "
                        "be equal to kTestAdditionalParameterValue.");
  XCTAssertNotNil(request.additionalHeaders,
                  @"Request's additionalHeaders field should not be nil.");
  XCTAssertEqualObjects(request.additionalHeaders[kTestAdditionalHeaderKey],
                        kTestAdditionalHeaderValue,
                        @"The request's kTestAdditionalHeaderKey additional parameter should "
                        "be equal to kTestAdditionalHeaderValue.");

  OIDTokenRequest *requestCopy = [request copy];

  // Not a full test of the configuration deserialization, but should be sufficient as a smoke test
  // to make sure the configuration IS actually getting carried along in the copy implementation.
  XCTAssertEqualObjects(requestCopy.configuration.authorizationEndpoint,
                        request.configuration.authorizationEndpoint, @"");

  XCTAssertEqualObjects(requestCopy.grantType, request.grantType, @"");
  XCTAssertEqualObjects(requestCopy.authorizationCode, request.authorizationCode, @"");
  XCTAssertEqualObjects(requestCopy.redirectURL, request.redirectURL, @"");
  XCTAssertEqualObjects(requestCopy.clientID, request.clientID, @"");
  XCTAssertEqualObjects(requestCopy.clientSecret, request.clientSecret, @"");
  XCTAssertEqualObjects(requestCopy.scope, authResponse.request.scope, @"");
  XCTAssertEqualObjects(requestCopy.refreshToken, kRefreshTokenTestValue, @"");
  XCTAssertEqualObjects(requestCopy.codeVerifier, authResponse.request.codeVerifier, @"");
  XCTAssertNotNil(requestCopy.additionalParameters, @"");
  XCTAssertEqualObjects(requestCopy.additionalParameters[kTestAdditionalParameterKey],
                        kTestAdditionalParameterValue, @"");
  XCTAssertNotNil(requestCopy.additionalHeaders, @"");
  XCTAssertEqualObjects(requestCopy.additionalHeaders[kTestAdditionalHeaderKey],
                        kTestAdditionalHeaderValue, @"");
}

/*! @brief Tests the @c NSSecureCoding by round-tripping an instance through the coding process and
        checking to make sure the source and destination instances are equivalent.
 */
- (void)testSecureCoding {
  OIDAuthorizationResponse *authResponse = [OIDAuthorizationResponseTests testInstance];
  OIDTokenRequest *request = [[self class] testInstance];

  XCTAssertEqualObjects(request.configuration.authorizationEndpoint,
                        authResponse.request.configuration.authorizationEndpoint, @"");
  XCTAssertEqualObjects(request.grantType, OIDGrantTypeAuthorizationCode, @"");
  XCTAssertEqualObjects(request.authorizationCode, authResponse.authorizationCode, @"");
  XCTAssertEqualObjects(request.redirectURL, authResponse.request.redirectURL, @"");
  XCTAssertEqualObjects(request.clientID, authResponse.request.clientID, @"");
  XCTAssertEqualObjects(request.clientSecret, authResponse.request.clientSecret, @"");
  XCTAssertEqualObjects(request.scope, authResponse.request.scope, @"");
  XCTAssertEqualObjects(request.refreshToken, kRefreshTokenTestValue, @"");
  XCTAssertEqualObjects(request.codeVerifier, authResponse.request.codeVerifier, @"");
  XCTAssertNotNil(request.additionalParameters, @"");
  XCTAssertEqualObjects(request.additionalParameters[kTestAdditionalParameterKey],
                        kTestAdditionalParameterValue, @"");
  XCTAssertNotNil(request.additionalHeaders, @"");
  XCTAssertEqualObjects(request.additionalHeaders[kTestAdditionalHeaderKey],
                        kTestAdditionalHeaderValue, @"");
  
  NSURLRequest *urlRequest = [request URLRequest];
  XCTAssertEqualObjects([urlRequest.allHTTPHeaderFields objectForKey:kTestAdditionalHeaderKey],
                        kTestAdditionalHeaderValue);

  OIDTokenRequest *requestCopy;
  NSError *error;
  NSData *data;
  if (@available(iOS 12.0, macOS 10.13, tvOS 11.0, watchOS 4.0, *)) {
    data = [NSKeyedArchiver archivedDataWithRootObject:request
                                 requiringSecureCoding:YES
                                                 error:&error];
    requestCopy = [NSKeyedUnarchiver unarchivedObjectOfClass:[OIDTokenRequest class]
                                                    fromData:data
                                                       error:&error];
  } else {
#if !TARGET_OS_IOS
    data = [NSKeyedArchiver archivedDataWithRootObject:request];
    requestCopy = [NSKeyedUnarchiver unarchiveObjectWithData:data];
#endif
  }

  // Not a full test of the configuration deserialization, but should be sufficient as a smoke test
  // to make sure the configuration IS actually getting serialized and deserialized in the
  // NSSecureCoding implementation. We'll leave it up to the OIDServiceConfiguration tests to make
  // sure the NSSecureCoding implementation of that class is correct.
  XCTAssertEqualObjects(requestCopy.configuration.authorizationEndpoint,
                        request.configuration.authorizationEndpoint, @"");
  XCTAssertEqualObjects(requestCopy.grantType, request.grantType, @"");
  XCTAssertEqualObjects(requestCopy.authorizationCode, request.authorizationCode, @"");
  XCTAssertEqualObjects(requestCopy.redirectURL, request.redirectURL, @"");
  XCTAssertEqualObjects(requestCopy.clientID, request.clientID, @"");
  XCTAssertEqualObjects(requestCopy.clientSecret, request.clientSecret, @"");
  XCTAssertEqualObjects(requestCopy.scope, authResponse.request.scope, @"");
  XCTAssertEqualObjects(requestCopy.refreshToken, kRefreshTokenTestValue, @"");
  XCTAssertEqualObjects(requestCopy.codeVerifier, authResponse.request.codeVerifier, @"");
  XCTAssertNotNil(requestCopy.additionalParameters, @"");
  XCTAssertEqualObjects(requestCopy.additionalParameters[kTestAdditionalParameterKey],
                        kTestAdditionalParameterValue, @"");
  XCTAssertNotNil(requestCopy.additionalHeaders, @"");
  XCTAssertEqualObjects(requestCopy.additionalHeaders[kTestAdditionalHeaderKey],
                        kTestAdditionalHeaderValue, @"");
  
  NSURLRequest *urlrequestCopy = [requestCopy URLRequest];
  XCTAssertEqualObjects([urlrequestCopy.allHTTPHeaderFields objectForKey:kTestAdditionalHeaderKey],
                        kTestAdditionalHeaderValue);
}

- (void)testURLRequestNoClientAuth {
  OIDTokenRequest *request = [[self class] testInstanceCodeExchange];
  NSURLRequest *urlRequest = [request URLRequest];

  id authorization = [urlRequest.allHTTPHeaderFields objectForKey:@"Authorization"];
  XCTAssertNil(authorization);
}

- (void)testURLRequestBasicClientAuth {
  OIDTokenRequest *request = [[self class] testInstanceCodeExchangeClientAuth];
  NSURLRequest* urlRequest = [request URLRequest];

  id authorization = [urlRequest.allHTTPHeaderFields objectForKey:@"Authorization"];
  XCTAssertNotNil(authorization);
}

- (void)testAuthorizationCodeNullRedirectURL {
  OIDAuthorizationResponse *authResponse = [OIDAuthorizationResponseTests testInstance];
  NSArray<NSString *> *scopesArray =
      [OIDScopeUtilities scopesArrayWithString:authResponse.request.scope];
  NSDictionary *additionalParameters =
      @{ kTestAdditionalParameterKey : kTestAdditionalParameterValue };
  NSDictionary *additionalHeaders =
      @{ kTestAdditionalHeaderKey : kTestAdditionalHeaderValue };
  XCTAssertThrows([[OIDTokenRequest alloc] initWithConfiguration:authResponse.request.configuration
                                                       grantType:OIDGrantTypeAuthorizationCode
                                               authorizationCode:authResponse.authorizationCode
                                                     redirectURL:nil
                                                        clientID:authResponse.request.clientID
                                                    clientSecret:authResponse.request.clientSecret
                                                          scopes:scopesArray
                                                    refreshToken:kRefreshTokenTestValue
                                                    codeVerifier:authResponse.request.codeVerifier
                                            additionalParameters:additionalParameters
                                               additionalHeaders:additionalHeaders], @"");
}

- (void)testThatAdditionalHeadersAreInTokenRequest {
  OIDTokenRequest *request = [[self class] testInstanceAdditionalHeaders];
  NSURLRequest* urlRequest = [request URLRequest];

  XCTAssertEqualObjects([urlRequest.allHTTPHeaderFields objectForKey:kTestAdditionalHeaderKey],
                        kTestAdditionalHeaderValue);
  
  XCTAssertEqualObjects([urlRequest.allHTTPHeaderFields objectForKey:kTestAdditionalHeaderKey2],
                        kTestAdditionalHeaderValue2);
}

@end

#pragma GCC diagnostic pop
