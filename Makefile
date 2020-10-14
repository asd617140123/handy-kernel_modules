KVERSION := $(shell uname -r)
KERNELSRC ?= /usr/src/linux-headers-$(KVERSION)
ARCH ?= x86_64
CROSS_COMPILE ?=

PWD ?= $(shell pwd)

test_name := linked_list
obj-m := $(test_name).o
# obj-m := helloworld_param.o
# obj-m := proc_info.o

# obj-m := container_of.o
# obj-m := linked_list.o

# obj-m := kthread_simple.o
# obj-m := kthread_advanced.o

# obj-m := lock_mutex.o
# obj-m := lock_spin_lock.o
# obj-m := lock_semaphore.o
# obj-m := lock_rw_semaphore.o

# obj-m := char_device.o
# obj-m := char_device_fops.o
# obj-m := char_device_sysfs.o

# obj-m := timer.o
# obj-m := timer_hr.o
# obj-m := timer_hr_repetitive.o

# obj-m := tasklet.o
# obj-m := wait_queue.o
# obj-m := work_queue_simple.o
# obj-m := work_queue_delayed.o

.PHONY: all default
all default:
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERNELSRC) M=$(PWD) modules

.PHONY: clean
clean:
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERNELSRC) M=$(PWD) clean

.PHONY: install module_install
install:
	sudo insmod $(test_name).ko
uninstall:
	sudo rmmod $(test_name).ko
module_install:
	$(MAKE)  ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERNELSRC) M=$(PWD) module_install
