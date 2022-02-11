#include <gtest/gtest.h>
#include <memory>

namespace
{
    class Foo {};
    const thread_local Foo this_is_no_problem;
    const thread_local auto global_smart_ptr = std::make_unique<Foo>();  // Compiling with this enabled will cause vstest with code coverage enabled to fail.
}

TEST(threadinglocalstorage, test_thread_local)
{
    const thread_local auto local_smart_ptr = std::make_unique<Foo>();  // Compiling with this enabled is fine
    EXPECT_TRUE(true);
}

int main(int argc, char* argv[])
{
    ::testing::InitGoogleTest(&argc, argv);

    return RUN_ALL_TESTS();
}
