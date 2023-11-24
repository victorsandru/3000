#include <linux/build-salt.h>
#include <linux/module.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

BUILD_SALT;

MODULE_INFO(vermagic, VERMAGIC_STRING);
MODULE_INFO(name, KBUILD_MODNAME);

__visible struct module __this_module
__section(.gnu.linkonce.this_module) = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};

#ifdef CONFIG_RETPOLINE
MODULE_INFO(retpoline, "Y");
#endif

static const struct modversion_info ____versions[]
__used __section(__versions) = {
	{ 0xdd8f8694, "module_layout" },
	{ 0x22e92418, "device_destroy" },
	{ 0x6bc3fbc0, "__unregister_chrdev" },
	{ 0xb65e5a32, "class_destroy" },
	{ 0x12bae5b3, "class_unregister" },
	{ 0x7749276a, "device_create" },
	{ 0x2871e975, "__class_create" },
	{ 0x9a19ed29, "__register_chrdev" },
	{ 0xcbd4898c, "fortify_panic" },
	{ 0xdecd0b29, "__stack_chk_fail" },
	{ 0xc3aaf0a9, "__put_user_1" },
	{ 0xa916b694, "strnlen" },
	{ 0x656e4a6e, "snprintf" },
	{ 0xaab69fcf, "init_pid_ns" },
	{ 0x4d60c256, "__task_pid_nr_ns" },
	{ 0x56b1771b, "current_task" },
	{ 0xc5850110, "printk" },
	{ 0xbdfb6dbb, "__fentry__" },
};

MODULE_INFO(depends, "");


MODULE_INFO(srcversion, "FEDB0BAF1AAF47FC30EBCC1");
