TARGET_NAME =
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++14 -s -O2

LDFLAGS =
LIBS =
INCLUDE = -I./include

SRCDIR = ./src
SRC = $(wildcard $(SRCDIR)/*.cpp)

BUILD_DIR = ./build
TARGET = $(BUILD_DIR)/$(TARGET_NAME)

OBJ = $(addprefix $(BUILD_DIR)/obj/, $(notdir $(SRC:.cpp=.o)))
DEPEND = $(OBJ:.o=.d)

.PHONY: all
all: $(TARGET)

-include $(DEPEND)

$(TARGET): $(OBJ)
	$(CXX) -o $@ $^ $(LDFLAGS) $(LIBS)


$(BUILD_DIR)/obj/%.o: $(SRCDIR)/%.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDE)  -o $@ -c -MMD -MP $<


.PHONY: clean
clean:
	-rm -f $(OBJ) $(DEPEND) $(TARGET)
.PHONY: run
run: $(TARGET)
	$(TARGET)

