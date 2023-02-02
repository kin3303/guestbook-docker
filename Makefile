SUB_DIRS = guestbook

include settings.mk

.PHONY: $(COMMON_TARGETS)

$(COMMON_TARGETS):
	$(foreach DIR, $(SUB_DIRS), $(MAKE) -C $(DIR) $@;)
