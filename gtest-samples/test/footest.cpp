
#include <gtest/gtest.h>
#include <mockcpp/mokc.h>

#include <foo.h>

TEST(TestApiHook, test_api_hook_ok)
{
	MOCKER(add)
	    .expects(once())
	    .will(returnValue(20));
	ASSERT_EQ(20, add(1, 2));
	GlobalMockObject::verify();
}

TEST(TestApiHook, test_api_hook_fail)
{
	MOCKER(add)
	    .expects(once())
	    .with(eq(2), eq(3))
	    .will(returnValue(20));
	ASSERT_EQ(20, add(1, 2));
	GlobalMockObject::verify();
}

