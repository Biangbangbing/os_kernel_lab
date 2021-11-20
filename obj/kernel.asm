
bin/kernel：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	f3 0f 1e fb          	endbr32 
  100004:	55                   	push   %ebp
  100005:	89 e5                	mov    %esp,%ebp
  100007:	53                   	push   %ebx
  100008:	83 ec 14             	sub    $0x14,%esp
  10000b:	e8 a3 02 00 00       	call   1002b3 <__x86.get_pc_thunk.bx>
  100010:	81 c3 40 09 01 00    	add    $0x10940,%ebx
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100016:	c7 c0 c0 1d 11 00    	mov    $0x111dc0,%eax
  10001c:	89 c2                	mov    %eax,%edx
  10001e:	c7 c0 50 09 11 00    	mov    $0x110950,%eax
  100024:	29 c2                	sub    %eax,%edx
  100026:	89 d0                	mov    %edx,%eax
  100028:	83 ec 04             	sub    $0x4,%esp
  10002b:	50                   	push   %eax
  10002c:	6a 00                	push   $0x0
  10002e:	c7 c0 50 09 11 00    	mov    $0x110950,%eax
  100034:	50                   	push   %eax
  100035:	e8 47 33 00 00       	call   103381 <memset>
  10003a:	83 c4 10             	add    $0x10,%esp

    cons_init();                // init the console
  10003d:	e8 04 19 00 00       	call   101946 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100042:	8d 83 88 32 ff ff    	lea    -0xcd78(%ebx),%eax
  100048:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("%s\n\n", message);
  10004b:	83 ec 08             	sub    $0x8,%esp
  10004e:	ff 75 f4             	pushl  -0xc(%ebp)
  100051:	8d 83 a4 32 ff ff    	lea    -0xcd5c(%ebx),%eax
  100057:	50                   	push   %eax
  100058:	e8 d1 02 00 00       	call   10032e <cprintf>
  10005d:	83 c4 10             	add    $0x10,%esp

    print_kerninfo();
  100060:	e8 0e 0a 00 00       	call   100a73 <print_kerninfo>

    grade_backtrace();
  100065:	e8 a9 00 00 00       	call   100113 <grade_backtrace>

    pmm_init();                 // init physical memory management
  10006a:	e8 4c 2f 00 00       	call   102fbb <pmm_init>

    pic_init();                 // init interrupt controller
  10006f:	e8 77 1a 00 00       	call   101aeb <pic_init>
    idt_init();                 // init interrupt descriptor table
  100074:	e8 29 1c 00 00       	call   101ca2 <idt_init>

    clock_init();               // init clock interrupt
  100079:	e8 68 0f 00 00       	call   100fe6 <clock_init>
    intr_enable();              // enable irq interrupt
  10007e:	e8 c2 1b 00 00       	call   101c45 <intr_enable>

    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    lab1_switch_test();   //按照要求消除注释，代表可以引用方法
  100083:	e8 ce 01 00 00       	call   100256 <lab1_switch_test>

    /* do nothing */
    while (1);
  100088:	eb fe                	jmp    100088 <kern_init+0x88>

0010008a <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  10008a:	f3 0f 1e fb          	endbr32 
  10008e:	55                   	push   %ebp
  10008f:	89 e5                	mov    %esp,%ebp
  100091:	53                   	push   %ebx
  100092:	83 ec 04             	sub    $0x4,%esp
  100095:	e8 15 02 00 00       	call   1002af <__x86.get_pc_thunk.ax>
  10009a:	05 b6 08 01 00       	add    $0x108b6,%eax
    mon_backtrace(0, NULL, NULL);
  10009f:	83 ec 04             	sub    $0x4,%esp
  1000a2:	6a 00                	push   $0x0
  1000a4:	6a 00                	push   $0x0
  1000a6:	6a 00                	push   $0x0
  1000a8:	89 c3                	mov    %eax,%ebx
  1000aa:	e8 10 0f 00 00       	call   100fbf <mon_backtrace>
  1000af:	83 c4 10             	add    $0x10,%esp
}
  1000b2:	90                   	nop
  1000b3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000b6:	c9                   	leave  
  1000b7:	c3                   	ret    

001000b8 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  1000b8:	f3 0f 1e fb          	endbr32 
  1000bc:	55                   	push   %ebp
  1000bd:	89 e5                	mov    %esp,%ebp
  1000bf:	53                   	push   %ebx
  1000c0:	83 ec 04             	sub    $0x4,%esp
  1000c3:	e8 e7 01 00 00       	call   1002af <__x86.get_pc_thunk.ax>
  1000c8:	05 88 08 01 00       	add    $0x10888,%eax
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  1000cd:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  1000d0:	8b 55 0c             	mov    0xc(%ebp),%edx
  1000d3:	8d 5d 08             	lea    0x8(%ebp),%ebx
  1000d6:	8b 45 08             	mov    0x8(%ebp),%eax
  1000d9:	51                   	push   %ecx
  1000da:	52                   	push   %edx
  1000db:	53                   	push   %ebx
  1000dc:	50                   	push   %eax
  1000dd:	e8 a8 ff ff ff       	call   10008a <grade_backtrace2>
  1000e2:	83 c4 10             	add    $0x10,%esp
}
  1000e5:	90                   	nop
  1000e6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000e9:	c9                   	leave  
  1000ea:	c3                   	ret    

001000eb <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000eb:	f3 0f 1e fb          	endbr32 
  1000ef:	55                   	push   %ebp
  1000f0:	89 e5                	mov    %esp,%ebp
  1000f2:	83 ec 08             	sub    $0x8,%esp
  1000f5:	e8 b5 01 00 00       	call   1002af <__x86.get_pc_thunk.ax>
  1000fa:	05 56 08 01 00       	add    $0x10856,%eax
    grade_backtrace1(arg0, arg2);
  1000ff:	83 ec 08             	sub    $0x8,%esp
  100102:	ff 75 10             	pushl  0x10(%ebp)
  100105:	ff 75 08             	pushl  0x8(%ebp)
  100108:	e8 ab ff ff ff       	call   1000b8 <grade_backtrace1>
  10010d:	83 c4 10             	add    $0x10,%esp
}
  100110:	90                   	nop
  100111:	c9                   	leave  
  100112:	c3                   	ret    

00100113 <grade_backtrace>:

void
grade_backtrace(void) {
  100113:	f3 0f 1e fb          	endbr32 
  100117:	55                   	push   %ebp
  100118:	89 e5                	mov    %esp,%ebp
  10011a:	83 ec 08             	sub    $0x8,%esp
  10011d:	e8 8d 01 00 00       	call   1002af <__x86.get_pc_thunk.ax>
  100122:	05 2e 08 01 00       	add    $0x1082e,%eax
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  100127:	8d 80 b0 f6 fe ff    	lea    -0x10950(%eax),%eax
  10012d:	83 ec 04             	sub    $0x4,%esp
  100130:	68 00 00 ff ff       	push   $0xffff0000
  100135:	50                   	push   %eax
  100136:	6a 00                	push   $0x0
  100138:	e8 ae ff ff ff       	call   1000eb <grade_backtrace0>
  10013d:	83 c4 10             	add    $0x10,%esp
}
  100140:	90                   	nop
  100141:	c9                   	leave  
  100142:	c3                   	ret    

00100143 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100143:	f3 0f 1e fb          	endbr32 
  100147:	55                   	push   %ebp
  100148:	89 e5                	mov    %esp,%ebp
  10014a:	53                   	push   %ebx
  10014b:	83 ec 14             	sub    $0x14,%esp
  10014e:	e8 60 01 00 00       	call   1002b3 <__x86.get_pc_thunk.bx>
  100153:	81 c3 fd 07 01 00    	add    $0x107fd,%ebx
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  100159:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  10015c:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  10015f:	8c 45 f2             	mov    %es,-0xe(%ebp)
  100162:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  100165:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100169:	0f b7 c0             	movzwl %ax,%eax
  10016c:	83 e0 03             	and    $0x3,%eax
  10016f:	89 c2                	mov    %eax,%edx
  100171:	8b 83 70 01 00 00    	mov    0x170(%ebx),%eax
  100177:	83 ec 04             	sub    $0x4,%esp
  10017a:	52                   	push   %edx
  10017b:	50                   	push   %eax
  10017c:	8d 83 a9 32 ff ff    	lea    -0xcd57(%ebx),%eax
  100182:	50                   	push   %eax
  100183:	e8 a6 01 00 00       	call   10032e <cprintf>
  100188:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  cs = %x\n", round, reg1);
  10018b:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10018f:	0f b7 d0             	movzwl %ax,%edx
  100192:	8b 83 70 01 00 00    	mov    0x170(%ebx),%eax
  100198:	83 ec 04             	sub    $0x4,%esp
  10019b:	52                   	push   %edx
  10019c:	50                   	push   %eax
  10019d:	8d 83 b7 32 ff ff    	lea    -0xcd49(%ebx),%eax
  1001a3:	50                   	push   %eax
  1001a4:	e8 85 01 00 00       	call   10032e <cprintf>
  1001a9:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ds = %x\n", round, reg2);
  1001ac:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  1001b0:	0f b7 d0             	movzwl %ax,%edx
  1001b3:	8b 83 70 01 00 00    	mov    0x170(%ebx),%eax
  1001b9:	83 ec 04             	sub    $0x4,%esp
  1001bc:	52                   	push   %edx
  1001bd:	50                   	push   %eax
  1001be:	8d 83 c5 32 ff ff    	lea    -0xcd3b(%ebx),%eax
  1001c4:	50                   	push   %eax
  1001c5:	e8 64 01 00 00       	call   10032e <cprintf>
  1001ca:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  es = %x\n", round, reg3);
  1001cd:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  1001d1:	0f b7 d0             	movzwl %ax,%edx
  1001d4:	8b 83 70 01 00 00    	mov    0x170(%ebx),%eax
  1001da:	83 ec 04             	sub    $0x4,%esp
  1001dd:	52                   	push   %edx
  1001de:	50                   	push   %eax
  1001df:	8d 83 d3 32 ff ff    	lea    -0xcd2d(%ebx),%eax
  1001e5:	50                   	push   %eax
  1001e6:	e8 43 01 00 00       	call   10032e <cprintf>
  1001eb:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ss = %x\n", round, reg4);
  1001ee:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1001f2:	0f b7 d0             	movzwl %ax,%edx
  1001f5:	8b 83 70 01 00 00    	mov    0x170(%ebx),%eax
  1001fb:	83 ec 04             	sub    $0x4,%esp
  1001fe:	52                   	push   %edx
  1001ff:	50                   	push   %eax
  100200:	8d 83 e1 32 ff ff    	lea    -0xcd1f(%ebx),%eax
  100206:	50                   	push   %eax
  100207:	e8 22 01 00 00       	call   10032e <cprintf>
  10020c:	83 c4 10             	add    $0x10,%esp
    round ++;
  10020f:	8b 83 70 01 00 00    	mov    0x170(%ebx),%eax
  100215:	83 c0 01             	add    $0x1,%eax
  100218:	89 83 70 01 00 00    	mov    %eax,0x170(%ebx)
}
  10021e:	90                   	nop
  10021f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100222:	c9                   	leave  
  100223:	c3                   	ret    

00100224 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  100224:	f3 0f 1e fb          	endbr32 
  100228:	55                   	push   %ebp
  100229:	89 e5                	mov    %esp,%ebp
  10022b:	e8 7f 00 00 00       	call   1002af <__x86.get_pc_thunk.ax>
  100230:	05 20 07 01 00       	add    $0x10720,%eax
    //LAB1 CHALLENGE 1 : TODO  
    //当kernel 切换到用户态将ss，esp压入栈
    asm volatile(
  100235:	16                   	push   %ss
  100236:	54                   	push   %esp
  100237:	cd 78                	int    $0x78
  100239:	89 ec                	mov    %ebp,%esp
    	"movl %%ebp, %%esp"
    	:
    	: "i"(T_SWITCH_TOU)
    );
    
}
  10023b:	90                   	nop
  10023c:	5d                   	pop    %ebp
  10023d:	c3                   	ret    

0010023e <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  10023e:	f3 0f 1e fb          	endbr32 
  100242:	55                   	push   %ebp
  100243:	89 e5                	mov    %esp,%ebp
  100245:	e8 65 00 00 00       	call   1002af <__x86.get_pc_thunk.ax>
  10024a:	05 06 07 01 00       	add    $0x10706,%eax
    //LAB1 CHALLENGE 1 :  TODO
    asm volatile(
  10024f:	cd 79                	int    $0x79
  100251:	89 ec                	mov    %ebp,%esp
    "int %0 \n"
    "movl %%ebp, %%esp \n"
    :
    : "i"(T_SWITCH_TOK)
    );
}
  100253:	90                   	nop
  100254:	5d                   	pop    %ebp
  100255:	c3                   	ret    

00100256 <lab1_switch_test>:

static void
lab1_switch_test(void) {
  100256:	f3 0f 1e fb          	endbr32 
  10025a:	55                   	push   %ebp
  10025b:	89 e5                	mov    %esp,%ebp
  10025d:	53                   	push   %ebx
  10025e:	83 ec 04             	sub    $0x4,%esp
  100261:	e8 4d 00 00 00       	call   1002b3 <__x86.get_pc_thunk.bx>
  100266:	81 c3 ea 06 01 00    	add    $0x106ea,%ebx
    lab1_print_cur_status();
  10026c:	e8 d2 fe ff ff       	call   100143 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  100271:	83 ec 0c             	sub    $0xc,%esp
  100274:	8d 83 f0 32 ff ff    	lea    -0xcd10(%ebx),%eax
  10027a:	50                   	push   %eax
  10027b:	e8 ae 00 00 00       	call   10032e <cprintf>
  100280:	83 c4 10             	add    $0x10,%esp
    lab1_switch_to_user();
  100283:	e8 9c ff ff ff       	call   100224 <lab1_switch_to_user>
    lab1_print_cur_status();
  100288:	e8 b6 fe ff ff       	call   100143 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  10028d:	83 ec 0c             	sub    $0xc,%esp
  100290:	8d 83 10 33 ff ff    	lea    -0xccf0(%ebx),%eax
  100296:	50                   	push   %eax
  100297:	e8 92 00 00 00       	call   10032e <cprintf>
  10029c:	83 c4 10             	add    $0x10,%esp
    lab1_switch_to_kernel();
  10029f:	e8 9a ff ff ff       	call   10023e <lab1_switch_to_kernel>
    lab1_print_cur_status();
  1002a4:	e8 9a fe ff ff       	call   100143 <lab1_print_cur_status>
}
  1002a9:	90                   	nop
  1002aa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1002ad:	c9                   	leave  
  1002ae:	c3                   	ret    

001002af <__x86.get_pc_thunk.ax>:
  1002af:	8b 04 24             	mov    (%esp),%eax
  1002b2:	c3                   	ret    

001002b3 <__x86.get_pc_thunk.bx>:
  1002b3:	8b 1c 24             	mov    (%esp),%ebx
  1002b6:	c3                   	ret    

001002b7 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  1002b7:	f3 0f 1e fb          	endbr32 
  1002bb:	55                   	push   %ebp
  1002bc:	89 e5                	mov    %esp,%ebp
  1002be:	53                   	push   %ebx
  1002bf:	83 ec 04             	sub    $0x4,%esp
  1002c2:	e8 e8 ff ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  1002c7:	05 89 06 01 00       	add    $0x10689,%eax
    cons_putc(c);
  1002cc:	83 ec 0c             	sub    $0xc,%esp
  1002cf:	ff 75 08             	pushl  0x8(%ebp)
  1002d2:	89 c3                	mov    %eax,%ebx
  1002d4:	e8 b4 16 00 00       	call   10198d <cons_putc>
  1002d9:	83 c4 10             	add    $0x10,%esp
    (*cnt) ++;
  1002dc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002df:	8b 00                	mov    (%eax),%eax
  1002e1:	8d 50 01             	lea    0x1(%eax),%edx
  1002e4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002e7:	89 10                	mov    %edx,(%eax)
}
  1002e9:	90                   	nop
  1002ea:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1002ed:	c9                   	leave  
  1002ee:	c3                   	ret    

001002ef <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  1002ef:	f3 0f 1e fb          	endbr32 
  1002f3:	55                   	push   %ebp
  1002f4:	89 e5                	mov    %esp,%ebp
  1002f6:	53                   	push   %ebx
  1002f7:	83 ec 14             	sub    $0x14,%esp
  1002fa:	e8 b0 ff ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  1002ff:	05 51 06 01 00       	add    $0x10651,%eax
    int cnt = 0;
  100304:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  10030b:	ff 75 0c             	pushl  0xc(%ebp)
  10030e:	ff 75 08             	pushl  0x8(%ebp)
  100311:	8d 55 f4             	lea    -0xc(%ebp),%edx
  100314:	52                   	push   %edx
  100315:	8d 90 67 f9 fe ff    	lea    -0x10699(%eax),%edx
  10031b:	52                   	push   %edx
  10031c:	89 c3                	mov    %eax,%ebx
  10031e:	e8 05 34 00 00       	call   103728 <vprintfmt>
  100323:	83 c4 10             	add    $0x10,%esp
    return cnt;
  100326:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100329:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10032c:	c9                   	leave  
  10032d:	c3                   	ret    

0010032e <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  10032e:	f3 0f 1e fb          	endbr32 
  100332:	55                   	push   %ebp
  100333:	89 e5                	mov    %esp,%ebp
  100335:	83 ec 18             	sub    $0x18,%esp
  100338:	e8 72 ff ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  10033d:	05 13 06 01 00       	add    $0x10613,%eax
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100342:	8d 45 0c             	lea    0xc(%ebp),%eax
  100345:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100348:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10034b:	83 ec 08             	sub    $0x8,%esp
  10034e:	50                   	push   %eax
  10034f:	ff 75 08             	pushl  0x8(%ebp)
  100352:	e8 98 ff ff ff       	call   1002ef <vcprintf>
  100357:	83 c4 10             	add    $0x10,%esp
  10035a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10035d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100360:	c9                   	leave  
  100361:	c3                   	ret    

00100362 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100362:	f3 0f 1e fb          	endbr32 
  100366:	55                   	push   %ebp
  100367:	89 e5                	mov    %esp,%ebp
  100369:	53                   	push   %ebx
  10036a:	83 ec 04             	sub    $0x4,%esp
  10036d:	e8 3d ff ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  100372:	05 de 05 01 00       	add    $0x105de,%eax
    cons_putc(c);
  100377:	83 ec 0c             	sub    $0xc,%esp
  10037a:	ff 75 08             	pushl  0x8(%ebp)
  10037d:	89 c3                	mov    %eax,%ebx
  10037f:	e8 09 16 00 00       	call   10198d <cons_putc>
  100384:	83 c4 10             	add    $0x10,%esp
}
  100387:	90                   	nop
  100388:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10038b:	c9                   	leave  
  10038c:	c3                   	ret    

0010038d <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  10038d:	f3 0f 1e fb          	endbr32 
  100391:	55                   	push   %ebp
  100392:	89 e5                	mov    %esp,%ebp
  100394:	83 ec 18             	sub    $0x18,%esp
  100397:	e8 13 ff ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  10039c:	05 b4 05 01 00       	add    $0x105b4,%eax
    int cnt = 0;
  1003a1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  1003a8:	eb 14                	jmp    1003be <cputs+0x31>
        cputch(c, &cnt);
  1003aa:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  1003ae:	83 ec 08             	sub    $0x8,%esp
  1003b1:	8d 55 f0             	lea    -0x10(%ebp),%edx
  1003b4:	52                   	push   %edx
  1003b5:	50                   	push   %eax
  1003b6:	e8 fc fe ff ff       	call   1002b7 <cputch>
  1003bb:	83 c4 10             	add    $0x10,%esp
    while ((c = *str ++) != '\0') {
  1003be:	8b 45 08             	mov    0x8(%ebp),%eax
  1003c1:	8d 50 01             	lea    0x1(%eax),%edx
  1003c4:	89 55 08             	mov    %edx,0x8(%ebp)
  1003c7:	0f b6 00             	movzbl (%eax),%eax
  1003ca:	88 45 f7             	mov    %al,-0x9(%ebp)
  1003cd:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  1003d1:	75 d7                	jne    1003aa <cputs+0x1d>
    }
    cputch('\n', &cnt);
  1003d3:	83 ec 08             	sub    $0x8,%esp
  1003d6:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1003d9:	50                   	push   %eax
  1003da:	6a 0a                	push   $0xa
  1003dc:	e8 d6 fe ff ff       	call   1002b7 <cputch>
  1003e1:	83 c4 10             	add    $0x10,%esp
    return cnt;
  1003e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  1003e7:	c9                   	leave  
  1003e8:	c3                   	ret    

001003e9 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  1003e9:	f3 0f 1e fb          	endbr32 
  1003ed:	55                   	push   %ebp
  1003ee:	89 e5                	mov    %esp,%ebp
  1003f0:	53                   	push   %ebx
  1003f1:	83 ec 14             	sub    $0x14,%esp
  1003f4:	e8 ba fe ff ff       	call   1002b3 <__x86.get_pc_thunk.bx>
  1003f9:	81 c3 57 05 01 00    	add    $0x10557,%ebx
    int c;
    while ((c = cons_getc()) == 0)
  1003ff:	90                   	nop
  100400:	e8 c6 15 00 00       	call   1019cb <cons_getc>
  100405:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100408:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10040c:	74 f2                	je     100400 <getchar+0x17>
        /* do nothing */;
    return c;
  10040e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100411:	83 c4 14             	add    $0x14,%esp
  100414:	5b                   	pop    %ebx
  100415:	5d                   	pop    %ebp
  100416:	c3                   	ret    

00100417 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  100417:	f3 0f 1e fb          	endbr32 
  10041b:	55                   	push   %ebp
  10041c:	89 e5                	mov    %esp,%ebp
  10041e:	53                   	push   %ebx
  10041f:	83 ec 14             	sub    $0x14,%esp
  100422:	e8 8c fe ff ff       	call   1002b3 <__x86.get_pc_thunk.bx>
  100427:	81 c3 29 05 01 00    	add    $0x10529,%ebx
    if (prompt != NULL) {
  10042d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100431:	74 15                	je     100448 <readline+0x31>
        cprintf("%s", prompt);
  100433:	83 ec 08             	sub    $0x8,%esp
  100436:	ff 75 08             	pushl  0x8(%ebp)
  100439:	8d 83 2f 33 ff ff    	lea    -0xccd1(%ebx),%eax
  10043f:	50                   	push   %eax
  100440:	e8 e9 fe ff ff       	call   10032e <cprintf>
  100445:	83 c4 10             	add    $0x10,%esp
    }
    int i = 0, c;
  100448:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  10044f:	e8 95 ff ff ff       	call   1003e9 <getchar>
  100454:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100457:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10045b:	79 0a                	jns    100467 <readline+0x50>
            return NULL;
  10045d:	b8 00 00 00 00       	mov    $0x0,%eax
  100462:	e9 87 00 00 00       	jmp    1004ee <readline+0xd7>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100467:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  10046b:	7e 2c                	jle    100499 <readline+0x82>
  10046d:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100474:	7f 23                	jg     100499 <readline+0x82>
            cputchar(c);
  100476:	83 ec 0c             	sub    $0xc,%esp
  100479:	ff 75 f0             	pushl  -0x10(%ebp)
  10047c:	e8 e1 fe ff ff       	call   100362 <cputchar>
  100481:	83 c4 10             	add    $0x10,%esp
            buf[i ++] = c;
  100484:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100487:	8d 50 01             	lea    0x1(%eax),%edx
  10048a:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10048d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100490:	88 94 03 90 01 00 00 	mov    %dl,0x190(%ebx,%eax,1)
  100497:	eb 50                	jmp    1004e9 <readline+0xd2>
        }
        else if (c == '\b' && i > 0) {
  100499:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  10049d:	75 1a                	jne    1004b9 <readline+0xa2>
  10049f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1004a3:	7e 14                	jle    1004b9 <readline+0xa2>
            cputchar(c);
  1004a5:	83 ec 0c             	sub    $0xc,%esp
  1004a8:	ff 75 f0             	pushl  -0x10(%ebp)
  1004ab:	e8 b2 fe ff ff       	call   100362 <cputchar>
  1004b0:	83 c4 10             	add    $0x10,%esp
            i --;
  1004b3:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  1004b7:	eb 30                	jmp    1004e9 <readline+0xd2>
        }
        else if (c == '\n' || c == '\r') {
  1004b9:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  1004bd:	74 06                	je     1004c5 <readline+0xae>
  1004bf:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  1004c3:	75 8a                	jne    10044f <readline+0x38>
            cputchar(c);
  1004c5:	83 ec 0c             	sub    $0xc,%esp
  1004c8:	ff 75 f0             	pushl  -0x10(%ebp)
  1004cb:	e8 92 fe ff ff       	call   100362 <cputchar>
  1004d0:	83 c4 10             	add    $0x10,%esp
            buf[i] = '\0';
  1004d3:	8d 93 90 01 00 00    	lea    0x190(%ebx),%edx
  1004d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1004dc:	01 d0                	add    %edx,%eax
  1004de:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1004e1:	8d 83 90 01 00 00    	lea    0x190(%ebx),%eax
  1004e7:	eb 05                	jmp    1004ee <readline+0xd7>
        c = getchar();
  1004e9:	e9 61 ff ff ff       	jmp    10044f <readline+0x38>
        }
    }
}
  1004ee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1004f1:	c9                   	leave  
  1004f2:	c3                   	ret    

001004f3 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  1004f3:	f3 0f 1e fb          	endbr32 
  1004f7:	55                   	push   %ebp
  1004f8:	89 e5                	mov    %esp,%ebp
  1004fa:	53                   	push   %ebx
  1004fb:	83 ec 14             	sub    $0x14,%esp
  1004fe:	e8 b0 fd ff ff       	call   1002b3 <__x86.get_pc_thunk.bx>
  100503:	81 c3 4d 04 01 00    	add    $0x1044d,%ebx
    if (is_panic) {
  100509:	8b 83 90 05 00 00    	mov    0x590(%ebx),%eax
  10050f:	85 c0                	test   %eax,%eax
  100511:	75 4e                	jne    100561 <__panic+0x6e>
        goto panic_dead;
    }
    is_panic = 1;
  100513:	c7 83 90 05 00 00 01 	movl   $0x1,0x590(%ebx)
  10051a:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  10051d:	8d 45 14             	lea    0x14(%ebp),%eax
  100520:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100523:	83 ec 04             	sub    $0x4,%esp
  100526:	ff 75 0c             	pushl  0xc(%ebp)
  100529:	ff 75 08             	pushl  0x8(%ebp)
  10052c:	8d 83 32 33 ff ff    	lea    -0xccce(%ebx),%eax
  100532:	50                   	push   %eax
  100533:	e8 f6 fd ff ff       	call   10032e <cprintf>
  100538:	83 c4 10             	add    $0x10,%esp
    vcprintf(fmt, ap);
  10053b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10053e:	83 ec 08             	sub    $0x8,%esp
  100541:	50                   	push   %eax
  100542:	ff 75 10             	pushl  0x10(%ebp)
  100545:	e8 a5 fd ff ff       	call   1002ef <vcprintf>
  10054a:	83 c4 10             	add    $0x10,%esp
    cprintf("\n");
  10054d:	83 ec 0c             	sub    $0xc,%esp
  100550:	8d 83 4e 33 ff ff    	lea    -0xccb2(%ebx),%eax
  100556:	50                   	push   %eax
  100557:	e8 d2 fd ff ff       	call   10032e <cprintf>
  10055c:	83 c4 10             	add    $0x10,%esp
  10055f:	eb 01                	jmp    100562 <__panic+0x6f>
        goto panic_dead;
  100561:	90                   	nop
    va_end(ap);

panic_dead:
    intr_disable();
  100562:	e8 f4 16 00 00       	call   101c5b <intr_disable>
    while (1) {
        kmonitor(NULL);
  100567:	83 ec 0c             	sub    $0xc,%esp
  10056a:	6a 00                	push   $0x0
  10056c:	e8 28 09 00 00       	call   100e99 <kmonitor>
  100571:	83 c4 10             	add    $0x10,%esp
  100574:	eb f1                	jmp    100567 <__panic+0x74>

00100576 <__warn>:
    }
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100576:	f3 0f 1e fb          	endbr32 
  10057a:	55                   	push   %ebp
  10057b:	89 e5                	mov    %esp,%ebp
  10057d:	53                   	push   %ebx
  10057e:	83 ec 14             	sub    $0x14,%esp
  100581:	e8 2d fd ff ff       	call   1002b3 <__x86.get_pc_thunk.bx>
  100586:	81 c3 ca 03 01 00    	add    $0x103ca,%ebx
    va_list ap;
    va_start(ap, fmt);
  10058c:	8d 45 14             	lea    0x14(%ebp),%eax
  10058f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100592:	83 ec 04             	sub    $0x4,%esp
  100595:	ff 75 0c             	pushl  0xc(%ebp)
  100598:	ff 75 08             	pushl  0x8(%ebp)
  10059b:	8d 83 50 33 ff ff    	lea    -0xccb0(%ebx),%eax
  1005a1:	50                   	push   %eax
  1005a2:	e8 87 fd ff ff       	call   10032e <cprintf>
  1005a7:	83 c4 10             	add    $0x10,%esp
    vcprintf(fmt, ap);
  1005aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1005ad:	83 ec 08             	sub    $0x8,%esp
  1005b0:	50                   	push   %eax
  1005b1:	ff 75 10             	pushl  0x10(%ebp)
  1005b4:	e8 36 fd ff ff       	call   1002ef <vcprintf>
  1005b9:	83 c4 10             	add    $0x10,%esp
    cprintf("\n");
  1005bc:	83 ec 0c             	sub    $0xc,%esp
  1005bf:	8d 83 4e 33 ff ff    	lea    -0xccb2(%ebx),%eax
  1005c5:	50                   	push   %eax
  1005c6:	e8 63 fd ff ff       	call   10032e <cprintf>
  1005cb:	83 c4 10             	add    $0x10,%esp
    va_end(ap);
}
  1005ce:	90                   	nop
  1005cf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1005d2:	c9                   	leave  
  1005d3:	c3                   	ret    

001005d4 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  1005d4:	f3 0f 1e fb          	endbr32 
  1005d8:	55                   	push   %ebp
  1005d9:	89 e5                	mov    %esp,%ebp
  1005db:	e8 cf fc ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  1005e0:	05 70 03 01 00       	add    $0x10370,%eax
    return is_panic;
  1005e5:	8b 80 90 05 00 00    	mov    0x590(%eax),%eax
}
  1005eb:	5d                   	pop    %ebp
  1005ec:	c3                   	ret    

001005ed <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1005ed:	f3 0f 1e fb          	endbr32 
  1005f1:	55                   	push   %ebp
  1005f2:	89 e5                	mov    %esp,%ebp
  1005f4:	83 ec 20             	sub    $0x20,%esp
  1005f7:	e8 b3 fc ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  1005fc:	05 54 03 01 00       	add    $0x10354,%eax
    int l = *region_left, r = *region_right, any_matches = 0;
  100601:	8b 45 0c             	mov    0xc(%ebp),%eax
  100604:	8b 00                	mov    (%eax),%eax
  100606:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100609:	8b 45 10             	mov    0x10(%ebp),%eax
  10060c:	8b 00                	mov    (%eax),%eax
  10060e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100611:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  100618:	e9 d2 00 00 00       	jmp    1006ef <stab_binsearch+0x102>
        int true_m = (l + r) / 2, m = true_m;
  10061d:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100620:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100623:	01 d0                	add    %edx,%eax
  100625:	89 c2                	mov    %eax,%edx
  100627:	c1 ea 1f             	shr    $0x1f,%edx
  10062a:	01 d0                	add    %edx,%eax
  10062c:	d1 f8                	sar    %eax
  10062e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100631:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100634:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  100637:	eb 04                	jmp    10063d <stab_binsearch+0x50>
            m --;
  100639:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
        while (m >= l && stabs[m].n_type != type) {
  10063d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100640:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100643:	7c 1f                	jl     100664 <stab_binsearch+0x77>
  100645:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100648:	89 d0                	mov    %edx,%eax
  10064a:	01 c0                	add    %eax,%eax
  10064c:	01 d0                	add    %edx,%eax
  10064e:	c1 e0 02             	shl    $0x2,%eax
  100651:	89 c2                	mov    %eax,%edx
  100653:	8b 45 08             	mov    0x8(%ebp),%eax
  100656:	01 d0                	add    %edx,%eax
  100658:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10065c:	0f b6 c0             	movzbl %al,%eax
  10065f:	39 45 14             	cmp    %eax,0x14(%ebp)
  100662:	75 d5                	jne    100639 <stab_binsearch+0x4c>
        }
        if (m < l) {    // no match in [l, m]
  100664:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100667:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  10066a:	7d 0b                	jge    100677 <stab_binsearch+0x8a>
            l = true_m + 1;
  10066c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10066f:	83 c0 01             	add    $0x1,%eax
  100672:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  100675:	eb 78                	jmp    1006ef <stab_binsearch+0x102>
        }

        // actual binary search
        any_matches = 1;
  100677:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  10067e:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100681:	89 d0                	mov    %edx,%eax
  100683:	01 c0                	add    %eax,%eax
  100685:	01 d0                	add    %edx,%eax
  100687:	c1 e0 02             	shl    $0x2,%eax
  10068a:	89 c2                	mov    %eax,%edx
  10068c:	8b 45 08             	mov    0x8(%ebp),%eax
  10068f:	01 d0                	add    %edx,%eax
  100691:	8b 40 08             	mov    0x8(%eax),%eax
  100694:	39 45 18             	cmp    %eax,0x18(%ebp)
  100697:	76 13                	jbe    1006ac <stab_binsearch+0xbf>
            *region_left = m;
  100699:	8b 45 0c             	mov    0xc(%ebp),%eax
  10069c:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10069f:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  1006a1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1006a4:	83 c0 01             	add    $0x1,%eax
  1006a7:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1006aa:	eb 43                	jmp    1006ef <stab_binsearch+0x102>
        } else if (stabs[m].n_value > addr) {
  1006ac:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1006af:	89 d0                	mov    %edx,%eax
  1006b1:	01 c0                	add    %eax,%eax
  1006b3:	01 d0                	add    %edx,%eax
  1006b5:	c1 e0 02             	shl    $0x2,%eax
  1006b8:	89 c2                	mov    %eax,%edx
  1006ba:	8b 45 08             	mov    0x8(%ebp),%eax
  1006bd:	01 d0                	add    %edx,%eax
  1006bf:	8b 40 08             	mov    0x8(%eax),%eax
  1006c2:	39 45 18             	cmp    %eax,0x18(%ebp)
  1006c5:	73 16                	jae    1006dd <stab_binsearch+0xf0>
            *region_right = m - 1;
  1006c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1006ca:	8d 50 ff             	lea    -0x1(%eax),%edx
  1006cd:	8b 45 10             	mov    0x10(%ebp),%eax
  1006d0:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  1006d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1006d5:	83 e8 01             	sub    $0x1,%eax
  1006d8:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1006db:	eb 12                	jmp    1006ef <stab_binsearch+0x102>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  1006dd:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006e0:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1006e3:	89 10                	mov    %edx,(%eax)
            l = m;
  1006e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1006e8:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  1006eb:	83 45 18 01          	addl   $0x1,0x18(%ebp)
    while (l <= r) {
  1006ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1006f2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1006f5:	0f 8e 22 ff ff ff    	jle    10061d <stab_binsearch+0x30>
        }
    }

    if (!any_matches) {
  1006fb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1006ff:	75 0f                	jne    100710 <stab_binsearch+0x123>
        *region_right = *region_left - 1;
  100701:	8b 45 0c             	mov    0xc(%ebp),%eax
  100704:	8b 00                	mov    (%eax),%eax
  100706:	8d 50 ff             	lea    -0x1(%eax),%edx
  100709:	8b 45 10             	mov    0x10(%ebp),%eax
  10070c:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  10070e:	eb 3f                	jmp    10074f <stab_binsearch+0x162>
        l = *region_right;
  100710:	8b 45 10             	mov    0x10(%ebp),%eax
  100713:	8b 00                	mov    (%eax),%eax
  100715:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  100718:	eb 04                	jmp    10071e <stab_binsearch+0x131>
  10071a:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  10071e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100721:	8b 00                	mov    (%eax),%eax
  100723:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  100726:	7e 1f                	jle    100747 <stab_binsearch+0x15a>
  100728:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10072b:	89 d0                	mov    %edx,%eax
  10072d:	01 c0                	add    %eax,%eax
  10072f:	01 d0                	add    %edx,%eax
  100731:	c1 e0 02             	shl    $0x2,%eax
  100734:	89 c2                	mov    %eax,%edx
  100736:	8b 45 08             	mov    0x8(%ebp),%eax
  100739:	01 d0                	add    %edx,%eax
  10073b:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10073f:	0f b6 c0             	movzbl %al,%eax
  100742:	39 45 14             	cmp    %eax,0x14(%ebp)
  100745:	75 d3                	jne    10071a <stab_binsearch+0x12d>
        *region_left = l;
  100747:	8b 45 0c             	mov    0xc(%ebp),%eax
  10074a:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10074d:	89 10                	mov    %edx,(%eax)
}
  10074f:	90                   	nop
  100750:	c9                   	leave  
  100751:	c3                   	ret    

00100752 <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  100752:	f3 0f 1e fb          	endbr32 
  100756:	55                   	push   %ebp
  100757:	89 e5                	mov    %esp,%ebp
  100759:	53                   	push   %ebx
  10075a:	83 ec 34             	sub    $0x34,%esp
  10075d:	e8 51 fb ff ff       	call   1002b3 <__x86.get_pc_thunk.bx>
  100762:	81 c3 ee 01 01 00    	add    $0x101ee,%ebx
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  100768:	8b 45 0c             	mov    0xc(%ebp),%eax
  10076b:	8d 93 70 33 ff ff    	lea    -0xcc90(%ebx),%edx
  100771:	89 10                	mov    %edx,(%eax)
    info->eip_line = 0;
  100773:	8b 45 0c             	mov    0xc(%ebp),%eax
  100776:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  10077d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100780:	8d 93 70 33 ff ff    	lea    -0xcc90(%ebx),%edx
  100786:	89 50 08             	mov    %edx,0x8(%eax)
    info->eip_fn_namelen = 9;
  100789:	8b 45 0c             	mov    0xc(%ebp),%eax
  10078c:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  100793:	8b 45 0c             	mov    0xc(%ebp),%eax
  100796:	8b 55 08             	mov    0x8(%ebp),%edx
  100799:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  10079c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10079f:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  1007a6:	c7 c0 3c 44 10 00    	mov    $0x10443c,%eax
  1007ac:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stab_end = __STAB_END__;
  1007af:	c7 c0 14 d2 10 00    	mov    $0x10d214,%eax
  1007b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  1007b8:	c7 c0 15 d2 10 00    	mov    $0x10d215,%eax
  1007be:	89 45 ec             	mov    %eax,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  1007c1:	c7 c0 00 f3 10 00    	mov    $0x10f300,%eax
  1007c7:	89 45 e8             	mov    %eax,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  1007ca:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1007cd:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  1007d0:	76 0d                	jbe    1007df <debuginfo_eip+0x8d>
  1007d2:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1007d5:	83 e8 01             	sub    $0x1,%eax
  1007d8:	0f b6 00             	movzbl (%eax),%eax
  1007db:	84 c0                	test   %al,%al
  1007dd:	74 0a                	je     1007e9 <debuginfo_eip+0x97>
        return -1;
  1007df:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1007e4:	e9 85 02 00 00       	jmp    100a6e <debuginfo_eip+0x31c>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  1007e9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1007f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1007f3:	2b 45 f4             	sub    -0xc(%ebp),%eax
  1007f6:	c1 f8 02             	sar    $0x2,%eax
  1007f9:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  1007ff:	83 e8 01             	sub    $0x1,%eax
  100802:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  100805:	ff 75 08             	pushl  0x8(%ebp)
  100808:	6a 64                	push   $0x64
  10080a:	8d 45 e0             	lea    -0x20(%ebp),%eax
  10080d:	50                   	push   %eax
  10080e:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  100811:	50                   	push   %eax
  100812:	ff 75 f4             	pushl  -0xc(%ebp)
  100815:	e8 d3 fd ff ff       	call   1005ed <stab_binsearch>
  10081a:	83 c4 14             	add    $0x14,%esp
    if (lfile == 0)
  10081d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100820:	85 c0                	test   %eax,%eax
  100822:	75 0a                	jne    10082e <debuginfo_eip+0xdc>
        return -1;
  100824:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100829:	e9 40 02 00 00       	jmp    100a6e <debuginfo_eip+0x31c>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  10082e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100831:	89 45 dc             	mov    %eax,-0x24(%ebp)
  100834:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100837:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  10083a:	ff 75 08             	pushl  0x8(%ebp)
  10083d:	6a 24                	push   $0x24
  10083f:	8d 45 d8             	lea    -0x28(%ebp),%eax
  100842:	50                   	push   %eax
  100843:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100846:	50                   	push   %eax
  100847:	ff 75 f4             	pushl  -0xc(%ebp)
  10084a:	e8 9e fd ff ff       	call   1005ed <stab_binsearch>
  10084f:	83 c4 14             	add    $0x14,%esp

    if (lfun <= rfun) {
  100852:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100855:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100858:	39 c2                	cmp    %eax,%edx
  10085a:	7f 78                	jg     1008d4 <debuginfo_eip+0x182>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  10085c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10085f:	89 c2                	mov    %eax,%edx
  100861:	89 d0                	mov    %edx,%eax
  100863:	01 c0                	add    %eax,%eax
  100865:	01 d0                	add    %edx,%eax
  100867:	c1 e0 02             	shl    $0x2,%eax
  10086a:	89 c2                	mov    %eax,%edx
  10086c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10086f:	01 d0                	add    %edx,%eax
  100871:	8b 10                	mov    (%eax),%edx
  100873:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100876:	2b 45 ec             	sub    -0x14(%ebp),%eax
  100879:	39 c2                	cmp    %eax,%edx
  10087b:	73 22                	jae    10089f <debuginfo_eip+0x14d>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  10087d:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100880:	89 c2                	mov    %eax,%edx
  100882:	89 d0                	mov    %edx,%eax
  100884:	01 c0                	add    %eax,%eax
  100886:	01 d0                	add    %edx,%eax
  100888:	c1 e0 02             	shl    $0x2,%eax
  10088b:	89 c2                	mov    %eax,%edx
  10088d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100890:	01 d0                	add    %edx,%eax
  100892:	8b 10                	mov    (%eax),%edx
  100894:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100897:	01 c2                	add    %eax,%edx
  100899:	8b 45 0c             	mov    0xc(%ebp),%eax
  10089c:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  10089f:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1008a2:	89 c2                	mov    %eax,%edx
  1008a4:	89 d0                	mov    %edx,%eax
  1008a6:	01 c0                	add    %eax,%eax
  1008a8:	01 d0                	add    %edx,%eax
  1008aa:	c1 e0 02             	shl    $0x2,%eax
  1008ad:	89 c2                	mov    %eax,%edx
  1008af:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008b2:	01 d0                	add    %edx,%eax
  1008b4:	8b 50 08             	mov    0x8(%eax),%edx
  1008b7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008ba:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  1008bd:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008c0:	8b 40 10             	mov    0x10(%eax),%eax
  1008c3:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  1008c6:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1008c9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  1008cc:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1008cf:	89 45 d0             	mov    %eax,-0x30(%ebp)
  1008d2:	eb 15                	jmp    1008e9 <debuginfo_eip+0x197>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  1008d4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008d7:	8b 55 08             	mov    0x8(%ebp),%edx
  1008da:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  1008dd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1008e0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  1008e3:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1008e6:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  1008e9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008ec:	8b 40 08             	mov    0x8(%eax),%eax
  1008ef:	83 ec 08             	sub    $0x8,%esp
  1008f2:	6a 3a                	push   $0x3a
  1008f4:	50                   	push   %eax
  1008f5:	e8 df 28 00 00       	call   1031d9 <strfind>
  1008fa:	83 c4 10             	add    $0x10,%esp
  1008fd:	8b 55 0c             	mov    0xc(%ebp),%edx
  100900:	8b 52 08             	mov    0x8(%edx),%edx
  100903:	29 d0                	sub    %edx,%eax
  100905:	89 c2                	mov    %eax,%edx
  100907:	8b 45 0c             	mov    0xc(%ebp),%eax
  10090a:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  10090d:	83 ec 0c             	sub    $0xc,%esp
  100910:	ff 75 08             	pushl  0x8(%ebp)
  100913:	6a 44                	push   $0x44
  100915:	8d 45 d0             	lea    -0x30(%ebp),%eax
  100918:	50                   	push   %eax
  100919:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  10091c:	50                   	push   %eax
  10091d:	ff 75 f4             	pushl  -0xc(%ebp)
  100920:	e8 c8 fc ff ff       	call   1005ed <stab_binsearch>
  100925:	83 c4 20             	add    $0x20,%esp
    if (lline <= rline) {
  100928:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10092b:	8b 45 d0             	mov    -0x30(%ebp),%eax
  10092e:	39 c2                	cmp    %eax,%edx
  100930:	7f 24                	jg     100956 <debuginfo_eip+0x204>
        info->eip_line = stabs[rline].n_desc;
  100932:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100935:	89 c2                	mov    %eax,%edx
  100937:	89 d0                	mov    %edx,%eax
  100939:	01 c0                	add    %eax,%eax
  10093b:	01 d0                	add    %edx,%eax
  10093d:	c1 e0 02             	shl    $0x2,%eax
  100940:	89 c2                	mov    %eax,%edx
  100942:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100945:	01 d0                	add    %edx,%eax
  100947:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  10094b:	0f b7 d0             	movzwl %ax,%edx
  10094e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100951:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  100954:	eb 13                	jmp    100969 <debuginfo_eip+0x217>
        return -1;
  100956:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10095b:	e9 0e 01 00 00       	jmp    100a6e <debuginfo_eip+0x31c>
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  100960:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100963:	83 e8 01             	sub    $0x1,%eax
  100966:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while (lline >= lfile
  100969:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10096c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10096f:	39 c2                	cmp    %eax,%edx
  100971:	7c 56                	jl     1009c9 <debuginfo_eip+0x277>
           && stabs[lline].n_type != N_SOL
  100973:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100976:	89 c2                	mov    %eax,%edx
  100978:	89 d0                	mov    %edx,%eax
  10097a:	01 c0                	add    %eax,%eax
  10097c:	01 d0                	add    %edx,%eax
  10097e:	c1 e0 02             	shl    $0x2,%eax
  100981:	89 c2                	mov    %eax,%edx
  100983:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100986:	01 d0                	add    %edx,%eax
  100988:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10098c:	3c 84                	cmp    $0x84,%al
  10098e:	74 39                	je     1009c9 <debuginfo_eip+0x277>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100990:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100993:	89 c2                	mov    %eax,%edx
  100995:	89 d0                	mov    %edx,%eax
  100997:	01 c0                	add    %eax,%eax
  100999:	01 d0                	add    %edx,%eax
  10099b:	c1 e0 02             	shl    $0x2,%eax
  10099e:	89 c2                	mov    %eax,%edx
  1009a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009a3:	01 d0                	add    %edx,%eax
  1009a5:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1009a9:	3c 64                	cmp    $0x64,%al
  1009ab:	75 b3                	jne    100960 <debuginfo_eip+0x20e>
  1009ad:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1009b0:	89 c2                	mov    %eax,%edx
  1009b2:	89 d0                	mov    %edx,%eax
  1009b4:	01 c0                	add    %eax,%eax
  1009b6:	01 d0                	add    %edx,%eax
  1009b8:	c1 e0 02             	shl    $0x2,%eax
  1009bb:	89 c2                	mov    %eax,%edx
  1009bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009c0:	01 d0                	add    %edx,%eax
  1009c2:	8b 40 08             	mov    0x8(%eax),%eax
  1009c5:	85 c0                	test   %eax,%eax
  1009c7:	74 97                	je     100960 <debuginfo_eip+0x20e>
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  1009c9:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1009cc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1009cf:	39 c2                	cmp    %eax,%edx
  1009d1:	7c 42                	jl     100a15 <debuginfo_eip+0x2c3>
  1009d3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1009d6:	89 c2                	mov    %eax,%edx
  1009d8:	89 d0                	mov    %edx,%eax
  1009da:	01 c0                	add    %eax,%eax
  1009dc:	01 d0                	add    %edx,%eax
  1009de:	c1 e0 02             	shl    $0x2,%eax
  1009e1:	89 c2                	mov    %eax,%edx
  1009e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009e6:	01 d0                	add    %edx,%eax
  1009e8:	8b 10                	mov    (%eax),%edx
  1009ea:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009ed:	2b 45 ec             	sub    -0x14(%ebp),%eax
  1009f0:	39 c2                	cmp    %eax,%edx
  1009f2:	73 21                	jae    100a15 <debuginfo_eip+0x2c3>
        info->eip_file = stabstr + stabs[lline].n_strx;
  1009f4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1009f7:	89 c2                	mov    %eax,%edx
  1009f9:	89 d0                	mov    %edx,%eax
  1009fb:	01 c0                	add    %eax,%eax
  1009fd:	01 d0                	add    %edx,%eax
  1009ff:	c1 e0 02             	shl    $0x2,%eax
  100a02:	89 c2                	mov    %eax,%edx
  100a04:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a07:	01 d0                	add    %edx,%eax
  100a09:	8b 10                	mov    (%eax),%edx
  100a0b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100a0e:	01 c2                	add    %eax,%edx
  100a10:	8b 45 0c             	mov    0xc(%ebp),%eax
  100a13:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  100a15:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100a18:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100a1b:	39 c2                	cmp    %eax,%edx
  100a1d:	7d 4a                	jge    100a69 <debuginfo_eip+0x317>
        for (lline = lfun + 1;
  100a1f:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100a22:	83 c0 01             	add    $0x1,%eax
  100a25:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  100a28:	eb 18                	jmp    100a42 <debuginfo_eip+0x2f0>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  100a2a:	8b 45 0c             	mov    0xc(%ebp),%eax
  100a2d:	8b 40 14             	mov    0x14(%eax),%eax
  100a30:	8d 50 01             	lea    0x1(%eax),%edx
  100a33:	8b 45 0c             	mov    0xc(%ebp),%eax
  100a36:	89 50 14             	mov    %edx,0x14(%eax)
             lline ++) {
  100a39:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100a3c:	83 c0 01             	add    $0x1,%eax
  100a3f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100a42:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100a45:	8b 45 d8             	mov    -0x28(%ebp),%eax
        for (lline = lfun + 1;
  100a48:	39 c2                	cmp    %eax,%edx
  100a4a:	7d 1d                	jge    100a69 <debuginfo_eip+0x317>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100a4c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100a4f:	89 c2                	mov    %eax,%edx
  100a51:	89 d0                	mov    %edx,%eax
  100a53:	01 c0                	add    %eax,%eax
  100a55:	01 d0                	add    %edx,%eax
  100a57:	c1 e0 02             	shl    $0x2,%eax
  100a5a:	89 c2                	mov    %eax,%edx
  100a5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a5f:	01 d0                	add    %edx,%eax
  100a61:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100a65:	3c a0                	cmp    $0xa0,%al
  100a67:	74 c1                	je     100a2a <debuginfo_eip+0x2d8>
        }
    }
    return 0;
  100a69:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100a6e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100a71:	c9                   	leave  
  100a72:	c3                   	ret    

00100a73 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100a73:	f3 0f 1e fb          	endbr32 
  100a77:	55                   	push   %ebp
  100a78:	89 e5                	mov    %esp,%ebp
  100a7a:	53                   	push   %ebx
  100a7b:	83 ec 04             	sub    $0x4,%esp
  100a7e:	e8 30 f8 ff ff       	call   1002b3 <__x86.get_pc_thunk.bx>
  100a83:	81 c3 cd fe 00 00    	add    $0xfecd,%ebx
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  100a89:	83 ec 0c             	sub    $0xc,%esp
  100a8c:	8d 83 7a 33 ff ff    	lea    -0xcc86(%ebx),%eax
  100a92:	50                   	push   %eax
  100a93:	e8 96 f8 ff ff       	call   10032e <cprintf>
  100a98:	83 c4 10             	add    $0x10,%esp
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  100a9b:	83 ec 08             	sub    $0x8,%esp
  100a9e:	c7 c0 00 00 10 00    	mov    $0x100000,%eax
  100aa4:	50                   	push   %eax
  100aa5:	8d 83 93 33 ff ff    	lea    -0xcc6d(%ebx),%eax
  100aab:	50                   	push   %eax
  100aac:	e8 7d f8 ff ff       	call   10032e <cprintf>
  100ab1:	83 c4 10             	add    $0x10,%esp
    cprintf("  etext  0x%08x (phys)\n", etext);
  100ab4:	83 ec 08             	sub    $0x8,%esp
  100ab7:	c7 c0 d7 3b 10 00    	mov    $0x103bd7,%eax
  100abd:	50                   	push   %eax
  100abe:	8d 83 ab 33 ff ff    	lea    -0xcc55(%ebx),%eax
  100ac4:	50                   	push   %eax
  100ac5:	e8 64 f8 ff ff       	call   10032e <cprintf>
  100aca:	83 c4 10             	add    $0x10,%esp
    cprintf("  edata  0x%08x (phys)\n", edata);
  100acd:	83 ec 08             	sub    $0x8,%esp
  100ad0:	c7 c0 50 09 11 00    	mov    $0x110950,%eax
  100ad6:	50                   	push   %eax
  100ad7:	8d 83 c3 33 ff ff    	lea    -0xcc3d(%ebx),%eax
  100add:	50                   	push   %eax
  100ade:	e8 4b f8 ff ff       	call   10032e <cprintf>
  100ae3:	83 c4 10             	add    $0x10,%esp
    cprintf("  end    0x%08x (phys)\n", end);
  100ae6:	83 ec 08             	sub    $0x8,%esp
  100ae9:	c7 c0 c0 1d 11 00    	mov    $0x111dc0,%eax
  100aef:	50                   	push   %eax
  100af0:	8d 83 db 33 ff ff    	lea    -0xcc25(%ebx),%eax
  100af6:	50                   	push   %eax
  100af7:	e8 32 f8 ff ff       	call   10032e <cprintf>
  100afc:	83 c4 10             	add    $0x10,%esp
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  100aff:	c7 c0 c0 1d 11 00    	mov    $0x111dc0,%eax
  100b05:	89 c2                	mov    %eax,%edx
  100b07:	c7 c0 00 00 10 00    	mov    $0x100000,%eax
  100b0d:	29 c2                	sub    %eax,%edx
  100b0f:	89 d0                	mov    %edx,%eax
  100b11:	05 ff 03 00 00       	add    $0x3ff,%eax
  100b16:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  100b1c:	85 c0                	test   %eax,%eax
  100b1e:	0f 48 c2             	cmovs  %edx,%eax
  100b21:	c1 f8 0a             	sar    $0xa,%eax
  100b24:	83 ec 08             	sub    $0x8,%esp
  100b27:	50                   	push   %eax
  100b28:	8d 83 f4 33 ff ff    	lea    -0xcc0c(%ebx),%eax
  100b2e:	50                   	push   %eax
  100b2f:	e8 fa f7 ff ff       	call   10032e <cprintf>
  100b34:	83 c4 10             	add    $0x10,%esp
}
  100b37:	90                   	nop
  100b38:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100b3b:	c9                   	leave  
  100b3c:	c3                   	ret    

00100b3d <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  100b3d:	f3 0f 1e fb          	endbr32 
  100b41:	55                   	push   %ebp
  100b42:	89 e5                	mov    %esp,%ebp
  100b44:	53                   	push   %ebx
  100b45:	81 ec 24 01 00 00    	sub    $0x124,%esp
  100b4b:	e8 63 f7 ff ff       	call   1002b3 <__x86.get_pc_thunk.bx>
  100b50:	81 c3 00 fe 00 00    	add    $0xfe00,%ebx
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  100b56:	83 ec 08             	sub    $0x8,%esp
  100b59:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100b5c:	50                   	push   %eax
  100b5d:	ff 75 08             	pushl  0x8(%ebp)
  100b60:	e8 ed fb ff ff       	call   100752 <debuginfo_eip>
  100b65:	83 c4 10             	add    $0x10,%esp
  100b68:	85 c0                	test   %eax,%eax
  100b6a:	74 17                	je     100b83 <print_debuginfo+0x46>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  100b6c:	83 ec 08             	sub    $0x8,%esp
  100b6f:	ff 75 08             	pushl  0x8(%ebp)
  100b72:	8d 83 1e 34 ff ff    	lea    -0xcbe2(%ebx),%eax
  100b78:	50                   	push   %eax
  100b79:	e8 b0 f7 ff ff       	call   10032e <cprintf>
  100b7e:	83 c4 10             	add    $0x10,%esp
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  100b81:	eb 67                	jmp    100bea <print_debuginfo+0xad>
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100b83:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100b8a:	eb 1c                	jmp    100ba8 <print_debuginfo+0x6b>
            fnname[j] = info.eip_fn_name[j];
  100b8c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100b8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b92:	01 d0                	add    %edx,%eax
  100b94:	0f b6 00             	movzbl (%eax),%eax
  100b97:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100b9d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100ba0:	01 ca                	add    %ecx,%edx
  100ba2:	88 02                	mov    %al,(%edx)
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100ba4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100ba8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100bab:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  100bae:	7c dc                	jl     100b8c <print_debuginfo+0x4f>
        fnname[j] = '\0';
  100bb0:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  100bb6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100bb9:	01 d0                	add    %edx,%eax
  100bbb:	c6 00 00             	movb   $0x0,(%eax)
                fnname, eip - info.eip_fn_addr);
  100bbe:	8b 45 ec             	mov    -0x14(%ebp),%eax
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100bc1:	8b 55 08             	mov    0x8(%ebp),%edx
  100bc4:	89 d1                	mov    %edx,%ecx
  100bc6:	29 c1                	sub    %eax,%ecx
  100bc8:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100bcb:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100bce:	83 ec 0c             	sub    $0xc,%esp
  100bd1:	51                   	push   %ecx
  100bd2:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100bd8:	51                   	push   %ecx
  100bd9:	52                   	push   %edx
  100bda:	50                   	push   %eax
  100bdb:	8d 83 3a 34 ff ff    	lea    -0xcbc6(%ebx),%eax
  100be1:	50                   	push   %eax
  100be2:	e8 47 f7 ff ff       	call   10032e <cprintf>
  100be7:	83 c4 20             	add    $0x20,%esp
}
  100bea:	90                   	nop
  100beb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100bee:	c9                   	leave  
  100bef:	c3                   	ret    

00100bf0 <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100bf0:	f3 0f 1e fb          	endbr32 
  100bf4:	55                   	push   %ebp
  100bf5:	89 e5                	mov    %esp,%ebp
  100bf7:	83 ec 10             	sub    $0x10,%esp
  100bfa:	e8 b0 f6 ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  100bff:	05 51 fd 00 00       	add    $0xfd51,%eax
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100c04:	8b 45 04             	mov    0x4(%ebp),%eax
  100c07:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100c0a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100c0d:	c9                   	leave  
  100c0e:	c3                   	ret    

00100c0f <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100c0f:	f3 0f 1e fb          	endbr32 
  100c13:	55                   	push   %ebp
  100c14:	89 e5                	mov    %esp,%ebp
  100c16:	53                   	push   %ebx
  100c17:	83 ec 24             	sub    $0x24,%esp
  100c1a:	e8 94 f6 ff ff       	call   1002b3 <__x86.get_pc_thunk.bx>
  100c1f:	81 c3 31 fd 00 00    	add    $0xfd31,%ebx
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100c25:	89 e8                	mov    %ebp,%eax
  100c27:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return ebp;
  100c2a:	8b 45 e0             	mov    -0x20(%ebp),%eax
     /* LAB1 YOUR CODE : STEP 1 */
     uint32_t ebp = read_ebp();              //读取ebp，eip的值（栈底，下一条指令的地址）
  100c2d:	89 45 f4             	mov    %eax,-0xc(%ebp)
     uint32_t eip = read_eip();
  100c30:	e8 bb ff ff ff       	call   100bf0 <read_eip>
  100c35:	89 45 f0             	mov    %eax,-0x10(%ebp)
     int i=0,j=0;
  100c38:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  100c3f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
     for (i;i<STACKFRAME_DEPTH;i++){         //对于一个栈帧
  100c46:	e9 9e 00 00 00       	jmp    100ce9 <print_stackframe+0xda>
     	cprintf("ebp:%x , eip:%x ",ebp,eip);
  100c4b:	83 ec 04             	sub    $0x4,%esp
  100c4e:	ff 75 f0             	pushl  -0x10(%ebp)
  100c51:	ff 75 f4             	pushl  -0xc(%ebp)
  100c54:	8d 83 4c 34 ff ff    	lea    -0xcbb4(%ebx),%eax
  100c5a:	50                   	push   %eax
  100c5b:	e8 ce f6 ff ff       	call   10032e <cprintf>
  100c60:	83 c4 10             	add    $0x10,%esp
     	cprintf("args:");
  100c63:	83 ec 0c             	sub    $0xc,%esp
  100c66:	8d 83 5d 34 ff ff    	lea    -0xcba3(%ebx),%eax
  100c6c:	50                   	push   %eax
  100c6d:	e8 bc f6 ff ff       	call   10032e <cprintf>
  100c72:	83 c4 10             	add    $0x10,%esp
     	uint32_t *argus = (uint32_t*)ebp+2;  //获取ebp向下2位的4个参数
  100c75:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c78:	83 c0 08             	add    $0x8,%eax
  100c7b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     	for(j;j<4;j++)                       //
  100c7e:	eb 28                	jmp    100ca8 <print_stackframe+0x99>
     	    cprintf("%x ",argus[j]);
  100c80:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100c83:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100c8a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100c8d:	01 d0                	add    %edx,%eax
  100c8f:	8b 00                	mov    (%eax),%eax
  100c91:	83 ec 08             	sub    $0x8,%esp
  100c94:	50                   	push   %eax
  100c95:	8d 83 63 34 ff ff    	lea    -0xcb9d(%ebx),%eax
  100c9b:	50                   	push   %eax
  100c9c:	e8 8d f6 ff ff       	call   10032e <cprintf>
  100ca1:	83 c4 10             	add    $0x10,%esp
     	for(j;j<4;j++)                       //
  100ca4:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
  100ca8:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  100cac:	7e d2                	jle    100c80 <print_stackframe+0x71>
     	cprintf("\n");
  100cae:	83 ec 0c             	sub    $0xc,%esp
  100cb1:	8d 83 67 34 ff ff    	lea    -0xcb99(%ebx),%eax
  100cb7:	50                   	push   %eax
  100cb8:	e8 71 f6 ff ff       	call   10032e <cprintf>
  100cbd:	83 c4 10             	add    $0x10,%esp
     	print_debuginfo(eip-1);              //调用函数打印函数名和行号
  100cc0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100cc3:	83 e8 01             	sub    $0x1,%eax
  100cc6:	83 ec 0c             	sub    $0xc,%esp
  100cc9:	50                   	push   %eax
  100cca:	e8 6e fe ff ff       	call   100b3d <print_debuginfo>
  100ccf:	83 c4 10             	add    $0x10,%esp
     	eip = ((uint32_t*)(ebp+4))[0];                       //eip为上一次call之前压入的地址
  100cd2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cd5:	83 c0 04             	add    $0x4,%eax
  100cd8:	8b 00                	mov    (%eax),%eax
  100cda:	89 45 f0             	mov    %eax,-0x10(%ebp)
     	ebp = ((uint32_t*)ebp)[0];                         //弹出调用栈
  100cdd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ce0:	8b 00                	mov    (%eax),%eax
  100ce2:	89 45 f4             	mov    %eax,-0xc(%ebp)
     for (i;i<STACKFRAME_DEPTH;i++){         //对于一个栈帧
  100ce5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  100ce9:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100ced:	0f 8e 58 ff ff ff    	jle    100c4b <print_stackframe+0x3c>
      */
      
      
      
      
}
  100cf3:	90                   	nop
  100cf4:	90                   	nop
  100cf5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100cf8:	c9                   	leave  
  100cf9:	c3                   	ret    

00100cfa <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100cfa:	f3 0f 1e fb          	endbr32 
  100cfe:	55                   	push   %ebp
  100cff:	89 e5                	mov    %esp,%ebp
  100d01:	53                   	push   %ebx
  100d02:	83 ec 14             	sub    $0x14,%esp
  100d05:	e8 a9 f5 ff ff       	call   1002b3 <__x86.get_pc_thunk.bx>
  100d0a:	81 c3 46 fc 00 00    	add    $0xfc46,%ebx
    int argc = 0;
  100d10:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100d17:	eb 0c                	jmp    100d25 <parse+0x2b>
            *buf ++ = '\0';
  100d19:	8b 45 08             	mov    0x8(%ebp),%eax
  100d1c:	8d 50 01             	lea    0x1(%eax),%edx
  100d1f:	89 55 08             	mov    %edx,0x8(%ebp)
  100d22:	c6 00 00             	movb   $0x0,(%eax)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100d25:	8b 45 08             	mov    0x8(%ebp),%eax
  100d28:	0f b6 00             	movzbl (%eax),%eax
  100d2b:	84 c0                	test   %al,%al
  100d2d:	74 20                	je     100d4f <parse+0x55>
  100d2f:	8b 45 08             	mov    0x8(%ebp),%eax
  100d32:	0f b6 00             	movzbl (%eax),%eax
  100d35:	0f be c0             	movsbl %al,%eax
  100d38:	83 ec 08             	sub    $0x8,%esp
  100d3b:	50                   	push   %eax
  100d3c:	8d 83 ec 34 ff ff    	lea    -0xcb14(%ebx),%eax
  100d42:	50                   	push   %eax
  100d43:	e8 50 24 00 00       	call   103198 <strchr>
  100d48:	83 c4 10             	add    $0x10,%esp
  100d4b:	85 c0                	test   %eax,%eax
  100d4d:	75 ca                	jne    100d19 <parse+0x1f>
        }
        if (*buf == '\0') {
  100d4f:	8b 45 08             	mov    0x8(%ebp),%eax
  100d52:	0f b6 00             	movzbl (%eax),%eax
  100d55:	84 c0                	test   %al,%al
  100d57:	74 69                	je     100dc2 <parse+0xc8>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100d59:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100d5d:	75 14                	jne    100d73 <parse+0x79>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100d5f:	83 ec 08             	sub    $0x8,%esp
  100d62:	6a 10                	push   $0x10
  100d64:	8d 83 f1 34 ff ff    	lea    -0xcb0f(%ebx),%eax
  100d6a:	50                   	push   %eax
  100d6b:	e8 be f5 ff ff       	call   10032e <cprintf>
  100d70:	83 c4 10             	add    $0x10,%esp
        }
        argv[argc ++] = buf;
  100d73:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d76:	8d 50 01             	lea    0x1(%eax),%edx
  100d79:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100d7c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100d83:	8b 45 0c             	mov    0xc(%ebp),%eax
  100d86:	01 c2                	add    %eax,%edx
  100d88:	8b 45 08             	mov    0x8(%ebp),%eax
  100d8b:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100d8d:	eb 04                	jmp    100d93 <parse+0x99>
            buf ++;
  100d8f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100d93:	8b 45 08             	mov    0x8(%ebp),%eax
  100d96:	0f b6 00             	movzbl (%eax),%eax
  100d99:	84 c0                	test   %al,%al
  100d9b:	74 88                	je     100d25 <parse+0x2b>
  100d9d:	8b 45 08             	mov    0x8(%ebp),%eax
  100da0:	0f b6 00             	movzbl (%eax),%eax
  100da3:	0f be c0             	movsbl %al,%eax
  100da6:	83 ec 08             	sub    $0x8,%esp
  100da9:	50                   	push   %eax
  100daa:	8d 83 ec 34 ff ff    	lea    -0xcb14(%ebx),%eax
  100db0:	50                   	push   %eax
  100db1:	e8 e2 23 00 00       	call   103198 <strchr>
  100db6:	83 c4 10             	add    $0x10,%esp
  100db9:	85 c0                	test   %eax,%eax
  100dbb:	74 d2                	je     100d8f <parse+0x95>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100dbd:	e9 63 ff ff ff       	jmp    100d25 <parse+0x2b>
            break;
  100dc2:	90                   	nop
        }
    }
    return argc;
  100dc3:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100dc6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100dc9:	c9                   	leave  
  100dca:	c3                   	ret    

00100dcb <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100dcb:	f3 0f 1e fb          	endbr32 
  100dcf:	55                   	push   %ebp
  100dd0:	89 e5                	mov    %esp,%ebp
  100dd2:	56                   	push   %esi
  100dd3:	53                   	push   %ebx
  100dd4:	83 ec 50             	sub    $0x50,%esp
  100dd7:	e8 d7 f4 ff ff       	call   1002b3 <__x86.get_pc_thunk.bx>
  100ddc:	81 c3 74 fb 00 00    	add    $0xfb74,%ebx
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100de2:	83 ec 08             	sub    $0x8,%esp
  100de5:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100de8:	50                   	push   %eax
  100de9:	ff 75 08             	pushl  0x8(%ebp)
  100dec:	e8 09 ff ff ff       	call   100cfa <parse>
  100df1:	83 c4 10             	add    $0x10,%esp
  100df4:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100df7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100dfb:	75 0a                	jne    100e07 <runcmd+0x3c>
        return 0;
  100dfd:	b8 00 00 00 00       	mov    $0x0,%eax
  100e02:	e9 8b 00 00 00       	jmp    100e92 <runcmd+0xc7>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100e07:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100e0e:	eb 5f                	jmp    100e6f <runcmd+0xa4>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100e10:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100e13:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100e16:	8d b3 10 00 00 00    	lea    0x10(%ebx),%esi
  100e1c:	89 d0                	mov    %edx,%eax
  100e1e:	01 c0                	add    %eax,%eax
  100e20:	01 d0                	add    %edx,%eax
  100e22:	c1 e0 02             	shl    $0x2,%eax
  100e25:	01 f0                	add    %esi,%eax
  100e27:	8b 00                	mov    (%eax),%eax
  100e29:	83 ec 08             	sub    $0x8,%esp
  100e2c:	51                   	push   %ecx
  100e2d:	50                   	push   %eax
  100e2e:	e8 aa 22 00 00       	call   1030dd <strcmp>
  100e33:	83 c4 10             	add    $0x10,%esp
  100e36:	85 c0                	test   %eax,%eax
  100e38:	75 31                	jne    100e6b <runcmd+0xa0>
            return commands[i].func(argc - 1, argv + 1, tf);
  100e3a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100e3d:	8d 8b 18 00 00 00    	lea    0x18(%ebx),%ecx
  100e43:	89 d0                	mov    %edx,%eax
  100e45:	01 c0                	add    %eax,%eax
  100e47:	01 d0                	add    %edx,%eax
  100e49:	c1 e0 02             	shl    $0x2,%eax
  100e4c:	01 c8                	add    %ecx,%eax
  100e4e:	8b 10                	mov    (%eax),%edx
  100e50:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100e53:	83 c0 04             	add    $0x4,%eax
  100e56:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100e59:	83 e9 01             	sub    $0x1,%ecx
  100e5c:	83 ec 04             	sub    $0x4,%esp
  100e5f:	ff 75 0c             	pushl  0xc(%ebp)
  100e62:	50                   	push   %eax
  100e63:	51                   	push   %ecx
  100e64:	ff d2                	call   *%edx
  100e66:	83 c4 10             	add    $0x10,%esp
  100e69:	eb 27                	jmp    100e92 <runcmd+0xc7>
    for (i = 0; i < NCOMMANDS; i ++) {
  100e6b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100e6f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100e72:	83 f8 02             	cmp    $0x2,%eax
  100e75:	76 99                	jbe    100e10 <runcmd+0x45>
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100e77:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100e7a:	83 ec 08             	sub    $0x8,%esp
  100e7d:	50                   	push   %eax
  100e7e:	8d 83 0f 35 ff ff    	lea    -0xcaf1(%ebx),%eax
  100e84:	50                   	push   %eax
  100e85:	e8 a4 f4 ff ff       	call   10032e <cprintf>
  100e8a:	83 c4 10             	add    $0x10,%esp
    return 0;
  100e8d:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100e92:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100e95:	5b                   	pop    %ebx
  100e96:	5e                   	pop    %esi
  100e97:	5d                   	pop    %ebp
  100e98:	c3                   	ret    

00100e99 <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100e99:	f3 0f 1e fb          	endbr32 
  100e9d:	55                   	push   %ebp
  100e9e:	89 e5                	mov    %esp,%ebp
  100ea0:	53                   	push   %ebx
  100ea1:	83 ec 14             	sub    $0x14,%esp
  100ea4:	e8 0a f4 ff ff       	call   1002b3 <__x86.get_pc_thunk.bx>
  100ea9:	81 c3 a7 fa 00 00    	add    $0xfaa7,%ebx
    cprintf("Welcome to the kernel debug monitor!!\n");
  100eaf:	83 ec 0c             	sub    $0xc,%esp
  100eb2:	8d 83 28 35 ff ff    	lea    -0xcad8(%ebx),%eax
  100eb8:	50                   	push   %eax
  100eb9:	e8 70 f4 ff ff       	call   10032e <cprintf>
  100ebe:	83 c4 10             	add    $0x10,%esp
    cprintf("Type 'help' for a list of commands.\n");
  100ec1:	83 ec 0c             	sub    $0xc,%esp
  100ec4:	8d 83 50 35 ff ff    	lea    -0xcab0(%ebx),%eax
  100eca:	50                   	push   %eax
  100ecb:	e8 5e f4 ff ff       	call   10032e <cprintf>
  100ed0:	83 c4 10             	add    $0x10,%esp

    if (tf != NULL) {
  100ed3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100ed7:	74 0e                	je     100ee7 <kmonitor+0x4e>
        print_trapframe(tf);
  100ed9:	83 ec 0c             	sub    $0xc,%esp
  100edc:	ff 75 08             	pushl  0x8(%ebp)
  100edf:	e8 c6 0f 00 00       	call   101eaa <print_trapframe>
  100ee4:	83 c4 10             	add    $0x10,%esp
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100ee7:	83 ec 0c             	sub    $0xc,%esp
  100eea:	8d 83 75 35 ff ff    	lea    -0xca8b(%ebx),%eax
  100ef0:	50                   	push   %eax
  100ef1:	e8 21 f5 ff ff       	call   100417 <readline>
  100ef6:	83 c4 10             	add    $0x10,%esp
  100ef9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100efc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100f00:	74 e5                	je     100ee7 <kmonitor+0x4e>
            if (runcmd(buf, tf) < 0) {
  100f02:	83 ec 08             	sub    $0x8,%esp
  100f05:	ff 75 08             	pushl  0x8(%ebp)
  100f08:	ff 75 f4             	pushl  -0xc(%ebp)
  100f0b:	e8 bb fe ff ff       	call   100dcb <runcmd>
  100f10:	83 c4 10             	add    $0x10,%esp
  100f13:	85 c0                	test   %eax,%eax
  100f15:	78 02                	js     100f19 <kmonitor+0x80>
        if ((buf = readline("K> ")) != NULL) {
  100f17:	eb ce                	jmp    100ee7 <kmonitor+0x4e>
                break;
  100f19:	90                   	nop
            }
        }
    }
}
  100f1a:	90                   	nop
  100f1b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100f1e:	c9                   	leave  
  100f1f:	c3                   	ret    

00100f20 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100f20:	f3 0f 1e fb          	endbr32 
  100f24:	55                   	push   %ebp
  100f25:	89 e5                	mov    %esp,%ebp
  100f27:	56                   	push   %esi
  100f28:	53                   	push   %ebx
  100f29:	83 ec 10             	sub    $0x10,%esp
  100f2c:	e8 82 f3 ff ff       	call   1002b3 <__x86.get_pc_thunk.bx>
  100f31:	81 c3 1f fa 00 00    	add    $0xfa1f,%ebx
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100f37:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100f3e:	eb 44                	jmp    100f84 <mon_help+0x64>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100f40:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100f43:	8d 8b 14 00 00 00    	lea    0x14(%ebx),%ecx
  100f49:	89 d0                	mov    %edx,%eax
  100f4b:	01 c0                	add    %eax,%eax
  100f4d:	01 d0                	add    %edx,%eax
  100f4f:	c1 e0 02             	shl    $0x2,%eax
  100f52:	01 c8                	add    %ecx,%eax
  100f54:	8b 08                	mov    (%eax),%ecx
  100f56:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100f59:	8d b3 10 00 00 00    	lea    0x10(%ebx),%esi
  100f5f:	89 d0                	mov    %edx,%eax
  100f61:	01 c0                	add    %eax,%eax
  100f63:	01 d0                	add    %edx,%eax
  100f65:	c1 e0 02             	shl    $0x2,%eax
  100f68:	01 f0                	add    %esi,%eax
  100f6a:	8b 00                	mov    (%eax),%eax
  100f6c:	83 ec 04             	sub    $0x4,%esp
  100f6f:	51                   	push   %ecx
  100f70:	50                   	push   %eax
  100f71:	8d 83 79 35 ff ff    	lea    -0xca87(%ebx),%eax
  100f77:	50                   	push   %eax
  100f78:	e8 b1 f3 ff ff       	call   10032e <cprintf>
  100f7d:	83 c4 10             	add    $0x10,%esp
    for (i = 0; i < NCOMMANDS; i ++) {
  100f80:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100f84:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100f87:	83 f8 02             	cmp    $0x2,%eax
  100f8a:	76 b4                	jbe    100f40 <mon_help+0x20>
    }
    return 0;
  100f8c:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100f91:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100f94:	5b                   	pop    %ebx
  100f95:	5e                   	pop    %esi
  100f96:	5d                   	pop    %ebp
  100f97:	c3                   	ret    

00100f98 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100f98:	f3 0f 1e fb          	endbr32 
  100f9c:	55                   	push   %ebp
  100f9d:	89 e5                	mov    %esp,%ebp
  100f9f:	53                   	push   %ebx
  100fa0:	83 ec 04             	sub    $0x4,%esp
  100fa3:	e8 07 f3 ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  100fa8:	05 a8 f9 00 00       	add    $0xf9a8,%eax
    print_kerninfo();
  100fad:	89 c3                	mov    %eax,%ebx
  100faf:	e8 bf fa ff ff       	call   100a73 <print_kerninfo>
    return 0;
  100fb4:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100fb9:	83 c4 04             	add    $0x4,%esp
  100fbc:	5b                   	pop    %ebx
  100fbd:	5d                   	pop    %ebp
  100fbe:	c3                   	ret    

00100fbf <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100fbf:	f3 0f 1e fb          	endbr32 
  100fc3:	55                   	push   %ebp
  100fc4:	89 e5                	mov    %esp,%ebp
  100fc6:	53                   	push   %ebx
  100fc7:	83 ec 04             	sub    $0x4,%esp
  100fca:	e8 e0 f2 ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  100fcf:	05 81 f9 00 00       	add    $0xf981,%eax
    print_stackframe();
  100fd4:	89 c3                	mov    %eax,%ebx
  100fd6:	e8 34 fc ff ff       	call   100c0f <print_stackframe>
    return 0;
  100fdb:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100fe0:	83 c4 04             	add    $0x4,%esp
  100fe3:	5b                   	pop    %ebx
  100fe4:	5d                   	pop    %ebp
  100fe5:	c3                   	ret    

00100fe6 <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100fe6:	f3 0f 1e fb          	endbr32 
  100fea:	55                   	push   %ebp
  100feb:	89 e5                	mov    %esp,%ebp
  100fed:	53                   	push   %ebx
  100fee:	83 ec 14             	sub    $0x14,%esp
  100ff1:	e8 bd f2 ff ff       	call   1002b3 <__x86.get_pc_thunk.bx>
  100ff6:	81 c3 5a f9 00 00    	add    $0xf95a,%ebx
  100ffc:	66 c7 45 ee 43 00    	movw   $0x43,-0x12(%ebp)
  101002:	c6 45 ed 34          	movb   $0x34,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101006:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10100a:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10100e:	ee                   	out    %al,(%dx)
}
  10100f:	90                   	nop
  101010:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  101016:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10101a:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  10101e:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101022:	ee                   	out    %al,(%dx)
}
  101023:	90                   	nop
  101024:	66 c7 45 f6 40 00    	movw   $0x40,-0xa(%ebp)
  10102a:	c6 45 f5 2e          	movb   $0x2e,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10102e:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101032:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101036:	ee                   	out    %al,(%dx)
}
  101037:	90                   	nop
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  101038:	c7 c0 a8 19 11 00    	mov    $0x1119a8,%eax
  10103e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

    cprintf("++ setup timer interrupts\n");
  101044:	83 ec 0c             	sub    $0xc,%esp
  101047:	8d 83 82 35 ff ff    	lea    -0xca7e(%ebx),%eax
  10104d:	50                   	push   %eax
  10104e:	e8 db f2 ff ff       	call   10032e <cprintf>
  101053:	83 c4 10             	add    $0x10,%esp
    pic_enable(IRQ_TIMER);
  101056:	83 ec 0c             	sub    $0xc,%esp
  101059:	6a 00                	push   $0x0
  10105b:	e8 4e 0a 00 00       	call   101aae <pic_enable>
  101060:	83 c4 10             	add    $0x10,%esp
}
  101063:	90                   	nop
  101064:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101067:	c9                   	leave  
  101068:	c3                   	ret    

00101069 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  101069:	f3 0f 1e fb          	endbr32 
  10106d:	55                   	push   %ebp
  10106e:	89 e5                	mov    %esp,%ebp
  101070:	83 ec 10             	sub    $0x10,%esp
  101073:	e8 37 f2 ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  101078:	05 d8 f8 00 00       	add    $0xf8d8,%eax
  10107d:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101083:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  101087:	89 c2                	mov    %eax,%edx
  101089:	ec                   	in     (%dx),%al
  10108a:	88 45 f1             	mov    %al,-0xf(%ebp)
  10108d:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  101093:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  101097:	89 c2                	mov    %eax,%edx
  101099:	ec                   	in     (%dx),%al
  10109a:	88 45 f5             	mov    %al,-0xb(%ebp)
  10109d:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  1010a3:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  1010a7:	89 c2                	mov    %eax,%edx
  1010a9:	ec                   	in     (%dx),%al
  1010aa:	88 45 f9             	mov    %al,-0x7(%ebp)
  1010ad:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
  1010b3:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  1010b7:	89 c2                	mov    %eax,%edx
  1010b9:	ec                   	in     (%dx),%al
  1010ba:	88 45 fd             	mov    %al,-0x3(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  1010bd:	90                   	nop
  1010be:	c9                   	leave  
  1010bf:	c3                   	ret    

001010c0 <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  1010c0:	f3 0f 1e fb          	endbr32 
  1010c4:	55                   	push   %ebp
  1010c5:	89 e5                	mov    %esp,%ebp
  1010c7:	83 ec 20             	sub    $0x20,%esp
  1010ca:	e8 70 09 00 00       	call   101a3f <__x86.get_pc_thunk.cx>
  1010cf:	81 c1 81 f8 00 00    	add    $0xf881,%ecx
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  1010d5:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  1010dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1010df:	0f b7 00             	movzwl (%eax),%eax
  1010e2:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  1010e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1010e9:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  1010ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1010f1:	0f b7 00             	movzwl (%eax),%eax
  1010f4:	66 3d 5a a5          	cmp    $0xa55a,%ax
  1010f8:	74 12                	je     10110c <cga_init+0x4c>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  1010fa:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  101101:	66 c7 81 b6 05 00 00 	movw   $0x3b4,0x5b6(%ecx)
  101108:	b4 03 
  10110a:	eb 13                	jmp    10111f <cga_init+0x5f>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  10110c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10110f:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101113:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  101116:	66 c7 81 b6 05 00 00 	movw   $0x3d4,0x5b6(%ecx)
  10111d:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  10111f:	0f b7 81 b6 05 00 00 	movzwl 0x5b6(%ecx),%eax
  101126:	0f b7 c0             	movzwl %ax,%eax
  101129:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  10112d:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101131:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101135:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101139:	ee                   	out    %al,(%dx)
}
  10113a:	90                   	nop
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  10113b:	0f b7 81 b6 05 00 00 	movzwl 0x5b6(%ecx),%eax
  101142:	83 c0 01             	add    $0x1,%eax
  101145:	0f b7 c0             	movzwl %ax,%eax
  101148:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10114c:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
  101150:	89 c2                	mov    %eax,%edx
  101152:	ec                   	in     (%dx),%al
  101153:	88 45 e9             	mov    %al,-0x17(%ebp)
    return data;
  101156:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10115a:	0f b6 c0             	movzbl %al,%eax
  10115d:	c1 e0 08             	shl    $0x8,%eax
  101160:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  101163:	0f b7 81 b6 05 00 00 	movzwl 0x5b6(%ecx),%eax
  10116a:	0f b7 c0             	movzwl %ax,%eax
  10116d:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  101171:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101175:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101179:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10117d:	ee                   	out    %al,(%dx)
}
  10117e:	90                   	nop
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  10117f:	0f b7 81 b6 05 00 00 	movzwl 0x5b6(%ecx),%eax
  101186:	83 c0 01             	add    $0x1,%eax
  101189:	0f b7 c0             	movzwl %ax,%eax
  10118c:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101190:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  101194:	89 c2                	mov    %eax,%edx
  101196:	ec                   	in     (%dx),%al
  101197:	88 45 f1             	mov    %al,-0xf(%ebp)
    return data;
  10119a:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  10119e:	0f b6 c0             	movzbl %al,%eax
  1011a1:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  1011a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1011a7:	89 81 b0 05 00 00    	mov    %eax,0x5b0(%ecx)
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  1011ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1011b0:	66 89 81 b4 05 00 00 	mov    %ax,0x5b4(%ecx)
}
  1011b7:	90                   	nop
  1011b8:	c9                   	leave  
  1011b9:	c3                   	ret    

001011ba <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  1011ba:	f3 0f 1e fb          	endbr32 
  1011be:	55                   	push   %ebp
  1011bf:	89 e5                	mov    %esp,%ebp
  1011c1:	53                   	push   %ebx
  1011c2:	83 ec 34             	sub    $0x34,%esp
  1011c5:	e8 75 08 00 00       	call   101a3f <__x86.get_pc_thunk.cx>
  1011ca:	81 c1 86 f7 00 00    	add    $0xf786,%ecx
  1011d0:	66 c7 45 d2 fa 03    	movw   $0x3fa,-0x2e(%ebp)
  1011d6:	c6 45 d1 00          	movb   $0x0,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1011da:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  1011de:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  1011e2:	ee                   	out    %al,(%dx)
}
  1011e3:	90                   	nop
  1011e4:	66 c7 45 d6 fb 03    	movw   $0x3fb,-0x2a(%ebp)
  1011ea:	c6 45 d5 80          	movb   $0x80,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1011ee:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  1011f2:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  1011f6:	ee                   	out    %al,(%dx)
}
  1011f7:	90                   	nop
  1011f8:	66 c7 45 da f8 03    	movw   $0x3f8,-0x26(%ebp)
  1011fe:	c6 45 d9 0c          	movb   $0xc,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101202:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  101206:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  10120a:	ee                   	out    %al,(%dx)
}
  10120b:	90                   	nop
  10120c:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  101212:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101216:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  10121a:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  10121e:	ee                   	out    %al,(%dx)
}
  10121f:	90                   	nop
  101220:	66 c7 45 e2 fb 03    	movw   $0x3fb,-0x1e(%ebp)
  101226:	c6 45 e1 03          	movb   $0x3,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10122a:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  10122e:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  101232:	ee                   	out    %al,(%dx)
}
  101233:	90                   	nop
  101234:	66 c7 45 e6 fc 03    	movw   $0x3fc,-0x1a(%ebp)
  10123a:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10123e:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101242:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101246:	ee                   	out    %al,(%dx)
}
  101247:	90                   	nop
  101248:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  10124e:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101252:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101256:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10125a:	ee                   	out    %al,(%dx)
}
  10125b:	90                   	nop
  10125c:	66 c7 45 ee fd 03    	movw   $0x3fd,-0x12(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101262:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  101266:	89 c2                	mov    %eax,%edx
  101268:	ec                   	in     (%dx),%al
  101269:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  10126c:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  101270:	3c ff                	cmp    $0xff,%al
  101272:	0f 95 c0             	setne  %al
  101275:	0f b6 c0             	movzbl %al,%eax
  101278:	89 81 b8 05 00 00    	mov    %eax,0x5b8(%ecx)
  10127e:	66 c7 45 f2 fa 03    	movw   $0x3fa,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101284:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  101288:	89 c2                	mov    %eax,%edx
  10128a:	ec                   	in     (%dx),%al
  10128b:	88 45 f1             	mov    %al,-0xf(%ebp)
  10128e:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  101294:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  101298:	89 c2                	mov    %eax,%edx
  10129a:	ec                   	in     (%dx),%al
  10129b:	88 45 f5             	mov    %al,-0xb(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  10129e:	8b 81 b8 05 00 00    	mov    0x5b8(%ecx),%eax
  1012a4:	85 c0                	test   %eax,%eax
  1012a6:	74 0f                	je     1012b7 <serial_init+0xfd>
        pic_enable(IRQ_COM1);
  1012a8:	83 ec 0c             	sub    $0xc,%esp
  1012ab:	6a 04                	push   $0x4
  1012ad:	89 cb                	mov    %ecx,%ebx
  1012af:	e8 fa 07 00 00       	call   101aae <pic_enable>
  1012b4:	83 c4 10             	add    $0x10,%esp
    }
}
  1012b7:	90                   	nop
  1012b8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1012bb:	c9                   	leave  
  1012bc:	c3                   	ret    

001012bd <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  1012bd:	f3 0f 1e fb          	endbr32 
  1012c1:	55                   	push   %ebp
  1012c2:	89 e5                	mov    %esp,%ebp
  1012c4:	83 ec 20             	sub    $0x20,%esp
  1012c7:	e8 e3 ef ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  1012cc:	05 84 f6 00 00       	add    $0xf684,%eax
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  1012d1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1012d8:	eb 09                	jmp    1012e3 <lpt_putc_sub+0x26>
        delay();
  1012da:	e8 8a fd ff ff       	call   101069 <delay>
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  1012df:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1012e3:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  1012e9:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  1012ed:	89 c2                	mov    %eax,%edx
  1012ef:	ec                   	in     (%dx),%al
  1012f0:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  1012f3:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1012f7:	84 c0                	test   %al,%al
  1012f9:	78 09                	js     101304 <lpt_putc_sub+0x47>
  1012fb:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101302:	7e d6                	jle    1012da <lpt_putc_sub+0x1d>
    }
    outb(LPTPORT + 0, c);
  101304:	8b 45 08             	mov    0x8(%ebp),%eax
  101307:	0f b6 c0             	movzbl %al,%eax
  10130a:	66 c7 45 ee 78 03    	movw   $0x378,-0x12(%ebp)
  101310:	88 45 ed             	mov    %al,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101313:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101317:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10131b:	ee                   	out    %al,(%dx)
}
  10131c:	90                   	nop
  10131d:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  101323:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101327:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  10132b:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10132f:	ee                   	out    %al,(%dx)
}
  101330:	90                   	nop
  101331:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  101337:	c6 45 f5 08          	movb   $0x8,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10133b:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10133f:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101343:	ee                   	out    %al,(%dx)
}
  101344:	90                   	nop
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  101345:	90                   	nop
  101346:	c9                   	leave  
  101347:	c3                   	ret    

00101348 <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  101348:	f3 0f 1e fb          	endbr32 
  10134c:	55                   	push   %ebp
  10134d:	89 e5                	mov    %esp,%ebp
  10134f:	e8 5b ef ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  101354:	05 fc f5 00 00       	add    $0xf5fc,%eax
    if (c != '\b') {
  101359:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  10135d:	74 0d                	je     10136c <lpt_putc+0x24>
        lpt_putc_sub(c);
  10135f:	ff 75 08             	pushl  0x8(%ebp)
  101362:	e8 56 ff ff ff       	call   1012bd <lpt_putc_sub>
  101367:	83 c4 04             	add    $0x4,%esp
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  10136a:	eb 1e                	jmp    10138a <lpt_putc+0x42>
        lpt_putc_sub('\b');
  10136c:	6a 08                	push   $0x8
  10136e:	e8 4a ff ff ff       	call   1012bd <lpt_putc_sub>
  101373:	83 c4 04             	add    $0x4,%esp
        lpt_putc_sub(' ');
  101376:	6a 20                	push   $0x20
  101378:	e8 40 ff ff ff       	call   1012bd <lpt_putc_sub>
  10137d:	83 c4 04             	add    $0x4,%esp
        lpt_putc_sub('\b');
  101380:	6a 08                	push   $0x8
  101382:	e8 36 ff ff ff       	call   1012bd <lpt_putc_sub>
  101387:	83 c4 04             	add    $0x4,%esp
}
  10138a:	90                   	nop
  10138b:	c9                   	leave  
  10138c:	c3                   	ret    

0010138d <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  10138d:	f3 0f 1e fb          	endbr32 
  101391:	55                   	push   %ebp
  101392:	89 e5                	mov    %esp,%ebp
  101394:	56                   	push   %esi
  101395:	53                   	push   %ebx
  101396:	83 ec 20             	sub    $0x20,%esp
  101399:	e8 15 ef ff ff       	call   1002b3 <__x86.get_pc_thunk.bx>
  10139e:	81 c3 b2 f5 00 00    	add    $0xf5b2,%ebx
    // set black on white
    if (!(c & ~0xFF)) {
  1013a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1013a7:	b0 00                	mov    $0x0,%al
  1013a9:	85 c0                	test   %eax,%eax
  1013ab:	75 07                	jne    1013b4 <cga_putc+0x27>
        c |= 0x0700;
  1013ad:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  1013b4:	8b 45 08             	mov    0x8(%ebp),%eax
  1013b7:	0f b6 c0             	movzbl %al,%eax
  1013ba:	83 f8 0d             	cmp    $0xd,%eax
  1013bd:	74 6f                	je     10142e <cga_putc+0xa1>
  1013bf:	83 f8 0d             	cmp    $0xd,%eax
  1013c2:	0f 8f a1 00 00 00    	jg     101469 <cga_putc+0xdc>
  1013c8:	83 f8 08             	cmp    $0x8,%eax
  1013cb:	74 0a                	je     1013d7 <cga_putc+0x4a>
  1013cd:	83 f8 0a             	cmp    $0xa,%eax
  1013d0:	74 4b                	je     10141d <cga_putc+0x90>
  1013d2:	e9 92 00 00 00       	jmp    101469 <cga_putc+0xdc>
    case '\b':
        if (crt_pos > 0) {
  1013d7:	0f b7 83 b4 05 00 00 	movzwl 0x5b4(%ebx),%eax
  1013de:	66 85 c0             	test   %ax,%ax
  1013e1:	0f 84 a8 00 00 00    	je     10148f <cga_putc+0x102>
            crt_pos --;
  1013e7:	0f b7 83 b4 05 00 00 	movzwl 0x5b4(%ebx),%eax
  1013ee:	83 e8 01             	sub    $0x1,%eax
  1013f1:	66 89 83 b4 05 00 00 	mov    %ax,0x5b4(%ebx)
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  1013f8:	8b 45 08             	mov    0x8(%ebp),%eax
  1013fb:	b0 00                	mov    $0x0,%al
  1013fd:	83 c8 20             	or     $0x20,%eax
  101400:	89 c1                	mov    %eax,%ecx
  101402:	8b 83 b0 05 00 00    	mov    0x5b0(%ebx),%eax
  101408:	0f b7 93 b4 05 00 00 	movzwl 0x5b4(%ebx),%edx
  10140f:	0f b7 d2             	movzwl %dx,%edx
  101412:	01 d2                	add    %edx,%edx
  101414:	01 d0                	add    %edx,%eax
  101416:	89 ca                	mov    %ecx,%edx
  101418:	66 89 10             	mov    %dx,(%eax)
        }
        break;
  10141b:	eb 72                	jmp    10148f <cga_putc+0x102>
    case '\n':
        crt_pos += CRT_COLS;
  10141d:	0f b7 83 b4 05 00 00 	movzwl 0x5b4(%ebx),%eax
  101424:	83 c0 50             	add    $0x50,%eax
  101427:	66 89 83 b4 05 00 00 	mov    %ax,0x5b4(%ebx)
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  10142e:	0f b7 b3 b4 05 00 00 	movzwl 0x5b4(%ebx),%esi
  101435:	0f b7 8b b4 05 00 00 	movzwl 0x5b4(%ebx),%ecx
  10143c:	0f b7 c1             	movzwl %cx,%eax
  10143f:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  101445:	c1 e8 10             	shr    $0x10,%eax
  101448:	89 c2                	mov    %eax,%edx
  10144a:	66 c1 ea 06          	shr    $0x6,%dx
  10144e:	89 d0                	mov    %edx,%eax
  101450:	c1 e0 02             	shl    $0x2,%eax
  101453:	01 d0                	add    %edx,%eax
  101455:	c1 e0 04             	shl    $0x4,%eax
  101458:	29 c1                	sub    %eax,%ecx
  10145a:	89 ca                	mov    %ecx,%edx
  10145c:	89 f0                	mov    %esi,%eax
  10145e:	29 d0                	sub    %edx,%eax
  101460:	66 89 83 b4 05 00 00 	mov    %ax,0x5b4(%ebx)
        break;
  101467:	eb 27                	jmp    101490 <cga_putc+0x103>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  101469:	8b 8b b0 05 00 00    	mov    0x5b0(%ebx),%ecx
  10146f:	0f b7 83 b4 05 00 00 	movzwl 0x5b4(%ebx),%eax
  101476:	8d 50 01             	lea    0x1(%eax),%edx
  101479:	66 89 93 b4 05 00 00 	mov    %dx,0x5b4(%ebx)
  101480:	0f b7 c0             	movzwl %ax,%eax
  101483:	01 c0                	add    %eax,%eax
  101485:	01 c8                	add    %ecx,%eax
  101487:	8b 55 08             	mov    0x8(%ebp),%edx
  10148a:	66 89 10             	mov    %dx,(%eax)
        break;
  10148d:	eb 01                	jmp    101490 <cga_putc+0x103>
        break;
  10148f:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  101490:	0f b7 83 b4 05 00 00 	movzwl 0x5b4(%ebx),%eax
  101497:	66 3d cf 07          	cmp    $0x7cf,%ax
  10149b:	76 5d                	jbe    1014fa <cga_putc+0x16d>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  10149d:	8b 83 b0 05 00 00    	mov    0x5b0(%ebx),%eax
  1014a3:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  1014a9:	8b 83 b0 05 00 00    	mov    0x5b0(%ebx),%eax
  1014af:	83 ec 04             	sub    $0x4,%esp
  1014b2:	68 00 0f 00 00       	push   $0xf00
  1014b7:	52                   	push   %edx
  1014b8:	50                   	push   %eax
  1014b9:	e8 10 1f 00 00       	call   1033ce <memmove>
  1014be:	83 c4 10             	add    $0x10,%esp
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1014c1:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  1014c8:	eb 16                	jmp    1014e0 <cga_putc+0x153>
            crt_buf[i] = 0x0700 | ' ';
  1014ca:	8b 83 b0 05 00 00    	mov    0x5b0(%ebx),%eax
  1014d0:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1014d3:	01 d2                	add    %edx,%edx
  1014d5:	01 d0                	add    %edx,%eax
  1014d7:	66 c7 00 20 07       	movw   $0x720,(%eax)
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1014dc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1014e0:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  1014e7:	7e e1                	jle    1014ca <cga_putc+0x13d>
        }
        crt_pos -= CRT_COLS;
  1014e9:	0f b7 83 b4 05 00 00 	movzwl 0x5b4(%ebx),%eax
  1014f0:	83 e8 50             	sub    $0x50,%eax
  1014f3:	66 89 83 b4 05 00 00 	mov    %ax,0x5b4(%ebx)
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  1014fa:	0f b7 83 b6 05 00 00 	movzwl 0x5b6(%ebx),%eax
  101501:	0f b7 c0             	movzwl %ax,%eax
  101504:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  101508:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10150c:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101510:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101514:	ee                   	out    %al,(%dx)
}
  101515:	90                   	nop
    outb(addr_6845 + 1, crt_pos >> 8);
  101516:	0f b7 83 b4 05 00 00 	movzwl 0x5b4(%ebx),%eax
  10151d:	66 c1 e8 08          	shr    $0x8,%ax
  101521:	0f b6 c0             	movzbl %al,%eax
  101524:	0f b7 93 b6 05 00 00 	movzwl 0x5b6(%ebx),%edx
  10152b:	83 c2 01             	add    $0x1,%edx
  10152e:	0f b7 d2             	movzwl %dx,%edx
  101531:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  101535:	88 45 e9             	mov    %al,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101538:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10153c:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101540:	ee                   	out    %al,(%dx)
}
  101541:	90                   	nop
    outb(addr_6845, 15);
  101542:	0f b7 83 b6 05 00 00 	movzwl 0x5b6(%ebx),%eax
  101549:	0f b7 c0             	movzwl %ax,%eax
  10154c:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  101550:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101554:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101558:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10155c:	ee                   	out    %al,(%dx)
}
  10155d:	90                   	nop
    outb(addr_6845 + 1, crt_pos);
  10155e:	0f b7 83 b4 05 00 00 	movzwl 0x5b4(%ebx),%eax
  101565:	0f b6 c0             	movzbl %al,%eax
  101568:	0f b7 93 b6 05 00 00 	movzwl 0x5b6(%ebx),%edx
  10156f:	83 c2 01             	add    $0x1,%edx
  101572:	0f b7 d2             	movzwl %dx,%edx
  101575:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  101579:	88 45 f1             	mov    %al,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10157c:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101580:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101584:	ee                   	out    %al,(%dx)
}
  101585:	90                   	nop
}
  101586:	90                   	nop
  101587:	8d 65 f8             	lea    -0x8(%ebp),%esp
  10158a:	5b                   	pop    %ebx
  10158b:	5e                   	pop    %esi
  10158c:	5d                   	pop    %ebp
  10158d:	c3                   	ret    

0010158e <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  10158e:	f3 0f 1e fb          	endbr32 
  101592:	55                   	push   %ebp
  101593:	89 e5                	mov    %esp,%ebp
  101595:	83 ec 10             	sub    $0x10,%esp
  101598:	e8 12 ed ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  10159d:	05 b3 f3 00 00       	add    $0xf3b3,%eax
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  1015a2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1015a9:	eb 09                	jmp    1015b4 <serial_putc_sub+0x26>
        delay();
  1015ab:	e8 b9 fa ff ff       	call   101069 <delay>
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  1015b0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1015b4:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1015ba:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  1015be:	89 c2                	mov    %eax,%edx
  1015c0:	ec                   	in     (%dx),%al
  1015c1:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  1015c4:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1015c8:	0f b6 c0             	movzbl %al,%eax
  1015cb:	83 e0 20             	and    $0x20,%eax
  1015ce:	85 c0                	test   %eax,%eax
  1015d0:	75 09                	jne    1015db <serial_putc_sub+0x4d>
  1015d2:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  1015d9:	7e d0                	jle    1015ab <serial_putc_sub+0x1d>
    }
    outb(COM1 + COM_TX, c);
  1015db:	8b 45 08             	mov    0x8(%ebp),%eax
  1015de:	0f b6 c0             	movzbl %al,%eax
  1015e1:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  1015e7:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1015ea:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1015ee:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1015f2:	ee                   	out    %al,(%dx)
}
  1015f3:	90                   	nop
}
  1015f4:	90                   	nop
  1015f5:	c9                   	leave  
  1015f6:	c3                   	ret    

001015f7 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  1015f7:	f3 0f 1e fb          	endbr32 
  1015fb:	55                   	push   %ebp
  1015fc:	89 e5                	mov    %esp,%ebp
  1015fe:	e8 ac ec ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  101603:	05 4d f3 00 00       	add    $0xf34d,%eax
    if (c != '\b') {
  101608:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  10160c:	74 0d                	je     10161b <serial_putc+0x24>
        serial_putc_sub(c);
  10160e:	ff 75 08             	pushl  0x8(%ebp)
  101611:	e8 78 ff ff ff       	call   10158e <serial_putc_sub>
  101616:	83 c4 04             	add    $0x4,%esp
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  101619:	eb 1e                	jmp    101639 <serial_putc+0x42>
        serial_putc_sub('\b');
  10161b:	6a 08                	push   $0x8
  10161d:	e8 6c ff ff ff       	call   10158e <serial_putc_sub>
  101622:	83 c4 04             	add    $0x4,%esp
        serial_putc_sub(' ');
  101625:	6a 20                	push   $0x20
  101627:	e8 62 ff ff ff       	call   10158e <serial_putc_sub>
  10162c:	83 c4 04             	add    $0x4,%esp
        serial_putc_sub('\b');
  10162f:	6a 08                	push   $0x8
  101631:	e8 58 ff ff ff       	call   10158e <serial_putc_sub>
  101636:	83 c4 04             	add    $0x4,%esp
}
  101639:	90                   	nop
  10163a:	c9                   	leave  
  10163b:	c3                   	ret    

0010163c <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  10163c:	f3 0f 1e fb          	endbr32 
  101640:	55                   	push   %ebp
  101641:	89 e5                	mov    %esp,%ebp
  101643:	53                   	push   %ebx
  101644:	83 ec 14             	sub    $0x14,%esp
  101647:	e8 67 ec ff ff       	call   1002b3 <__x86.get_pc_thunk.bx>
  10164c:	81 c3 04 f3 00 00    	add    $0xf304,%ebx
    int c;
    while ((c = (*proc)()) != -1) {
  101652:	eb 36                	jmp    10168a <cons_intr+0x4e>
        if (c != 0) {
  101654:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  101658:	74 30                	je     10168a <cons_intr+0x4e>
            cons.buf[cons.wpos ++] = c;
  10165a:	8b 83 d4 07 00 00    	mov    0x7d4(%ebx),%eax
  101660:	8d 50 01             	lea    0x1(%eax),%edx
  101663:	89 93 d4 07 00 00    	mov    %edx,0x7d4(%ebx)
  101669:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10166c:	88 94 03 d0 05 00 00 	mov    %dl,0x5d0(%ebx,%eax,1)
            if (cons.wpos == CONSBUFSIZE) {
  101673:	8b 83 d4 07 00 00    	mov    0x7d4(%ebx),%eax
  101679:	3d 00 02 00 00       	cmp    $0x200,%eax
  10167e:	75 0a                	jne    10168a <cons_intr+0x4e>
                cons.wpos = 0;
  101680:	c7 83 d4 07 00 00 00 	movl   $0x0,0x7d4(%ebx)
  101687:	00 00 00 
    while ((c = (*proc)()) != -1) {
  10168a:	8b 45 08             	mov    0x8(%ebp),%eax
  10168d:	ff d0                	call   *%eax
  10168f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101692:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  101696:	75 bc                	jne    101654 <cons_intr+0x18>
            }
        }
    }
}
  101698:	90                   	nop
  101699:	90                   	nop
  10169a:	83 c4 14             	add    $0x14,%esp
  10169d:	5b                   	pop    %ebx
  10169e:	5d                   	pop    %ebp
  10169f:	c3                   	ret    

001016a0 <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  1016a0:	f3 0f 1e fb          	endbr32 
  1016a4:	55                   	push   %ebp
  1016a5:	89 e5                	mov    %esp,%ebp
  1016a7:	83 ec 10             	sub    $0x10,%esp
  1016aa:	e8 00 ec ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  1016af:	05 a1 f2 00 00       	add    $0xf2a1,%eax
  1016b4:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1016ba:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  1016be:	89 c2                	mov    %eax,%edx
  1016c0:	ec                   	in     (%dx),%al
  1016c1:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  1016c4:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  1016c8:	0f b6 c0             	movzbl %al,%eax
  1016cb:	83 e0 01             	and    $0x1,%eax
  1016ce:	85 c0                	test   %eax,%eax
  1016d0:	75 07                	jne    1016d9 <serial_proc_data+0x39>
        return -1;
  1016d2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1016d7:	eb 2a                	jmp    101703 <serial_proc_data+0x63>
  1016d9:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1016df:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  1016e3:	89 c2                	mov    %eax,%edx
  1016e5:	ec                   	in     (%dx),%al
  1016e6:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  1016e9:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  1016ed:	0f b6 c0             	movzbl %al,%eax
  1016f0:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  1016f3:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  1016f7:	75 07                	jne    101700 <serial_proc_data+0x60>
        c = '\b';
  1016f9:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  101700:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  101703:	c9                   	leave  
  101704:	c3                   	ret    

00101705 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  101705:	f3 0f 1e fb          	endbr32 
  101709:	55                   	push   %ebp
  10170a:	89 e5                	mov    %esp,%ebp
  10170c:	83 ec 08             	sub    $0x8,%esp
  10170f:	e8 9b eb ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  101714:	05 3c f2 00 00       	add    $0xf23c,%eax
    if (serial_exists) {
  101719:	8b 90 b8 05 00 00    	mov    0x5b8(%eax),%edx
  10171f:	85 d2                	test   %edx,%edx
  101721:	74 12                	je     101735 <serial_intr+0x30>
        cons_intr(serial_proc_data);
  101723:	83 ec 0c             	sub    $0xc,%esp
  101726:	8d 80 50 0d ff ff    	lea    -0xf2b0(%eax),%eax
  10172c:	50                   	push   %eax
  10172d:	e8 0a ff ff ff       	call   10163c <cons_intr>
  101732:	83 c4 10             	add    $0x10,%esp
    }
}
  101735:	90                   	nop
  101736:	c9                   	leave  
  101737:	c3                   	ret    

00101738 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  101738:	f3 0f 1e fb          	endbr32 
  10173c:	55                   	push   %ebp
  10173d:	89 e5                	mov    %esp,%ebp
  10173f:	53                   	push   %ebx
  101740:	83 ec 24             	sub    $0x24,%esp
  101743:	e8 f7 02 00 00       	call   101a3f <__x86.get_pc_thunk.cx>
  101748:	81 c1 08 f2 00 00    	add    $0xf208,%ecx
  10174e:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101754:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  101758:	89 c2                	mov    %eax,%edx
  10175a:	ec                   	in     (%dx),%al
  10175b:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  10175e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  101762:	0f b6 c0             	movzbl %al,%eax
  101765:	83 e0 01             	and    $0x1,%eax
  101768:	85 c0                	test   %eax,%eax
  10176a:	75 0a                	jne    101776 <kbd_proc_data+0x3e>
        return -1;
  10176c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101771:	e9 74 01 00 00       	jmp    1018ea <kbd_proc_data+0x1b2>
  101776:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10177c:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101780:	89 c2                	mov    %eax,%edx
  101782:	ec                   	in     (%dx),%al
  101783:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  101786:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  10178a:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  10178d:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  101791:	75 19                	jne    1017ac <kbd_proc_data+0x74>
        // E0 escape character
        shift |= E0ESC;
  101793:	8b 81 d8 07 00 00    	mov    0x7d8(%ecx),%eax
  101799:	83 c8 40             	or     $0x40,%eax
  10179c:	89 81 d8 07 00 00    	mov    %eax,0x7d8(%ecx)
        return 0;
  1017a2:	b8 00 00 00 00       	mov    $0x0,%eax
  1017a7:	e9 3e 01 00 00       	jmp    1018ea <kbd_proc_data+0x1b2>
    } else if (data & 0x80) {
  1017ac:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1017b0:	84 c0                	test   %al,%al
  1017b2:	79 4b                	jns    1017ff <kbd_proc_data+0xc7>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  1017b4:	8b 81 d8 07 00 00    	mov    0x7d8(%ecx),%eax
  1017ba:	83 e0 40             	and    $0x40,%eax
  1017bd:	85 c0                	test   %eax,%eax
  1017bf:	75 09                	jne    1017ca <kbd_proc_data+0x92>
  1017c1:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1017c5:	83 e0 7f             	and    $0x7f,%eax
  1017c8:	eb 04                	jmp    1017ce <kbd_proc_data+0x96>
  1017ca:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1017ce:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  1017d1:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1017d5:	0f b6 84 01 b0 f6 ff 	movzbl -0x950(%ecx,%eax,1),%eax
  1017dc:	ff 
  1017dd:	83 c8 40             	or     $0x40,%eax
  1017e0:	0f b6 c0             	movzbl %al,%eax
  1017e3:	f7 d0                	not    %eax
  1017e5:	89 c2                	mov    %eax,%edx
  1017e7:	8b 81 d8 07 00 00    	mov    0x7d8(%ecx),%eax
  1017ed:	21 d0                	and    %edx,%eax
  1017ef:	89 81 d8 07 00 00    	mov    %eax,0x7d8(%ecx)
        return 0;
  1017f5:	b8 00 00 00 00       	mov    $0x0,%eax
  1017fa:	e9 eb 00 00 00       	jmp    1018ea <kbd_proc_data+0x1b2>
    } else if (shift & E0ESC) {
  1017ff:	8b 81 d8 07 00 00    	mov    0x7d8(%ecx),%eax
  101805:	83 e0 40             	and    $0x40,%eax
  101808:	85 c0                	test   %eax,%eax
  10180a:	74 13                	je     10181f <kbd_proc_data+0xe7>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  10180c:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  101810:	8b 81 d8 07 00 00    	mov    0x7d8(%ecx),%eax
  101816:	83 e0 bf             	and    $0xffffffbf,%eax
  101819:	89 81 d8 07 00 00    	mov    %eax,0x7d8(%ecx)
    }

    shift |= shiftcode[data];
  10181f:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101823:	0f b6 84 01 b0 f6 ff 	movzbl -0x950(%ecx,%eax,1),%eax
  10182a:	ff 
  10182b:	0f b6 d0             	movzbl %al,%edx
  10182e:	8b 81 d8 07 00 00    	mov    0x7d8(%ecx),%eax
  101834:	09 d0                	or     %edx,%eax
  101836:	89 81 d8 07 00 00    	mov    %eax,0x7d8(%ecx)
    shift ^= togglecode[data];
  10183c:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101840:	0f b6 84 01 b0 f7 ff 	movzbl -0x850(%ecx,%eax,1),%eax
  101847:	ff 
  101848:	0f b6 d0             	movzbl %al,%edx
  10184b:	8b 81 d8 07 00 00    	mov    0x7d8(%ecx),%eax
  101851:	31 d0                	xor    %edx,%eax
  101853:	89 81 d8 07 00 00    	mov    %eax,0x7d8(%ecx)

    c = charcode[shift & (CTL | SHIFT)][data];
  101859:	8b 81 d8 07 00 00    	mov    0x7d8(%ecx),%eax
  10185f:	83 e0 03             	and    $0x3,%eax
  101862:	8b 94 81 34 00 00 00 	mov    0x34(%ecx,%eax,4),%edx
  101869:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10186d:	01 d0                	add    %edx,%eax
  10186f:	0f b6 00             	movzbl (%eax),%eax
  101872:	0f b6 c0             	movzbl %al,%eax
  101875:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  101878:	8b 81 d8 07 00 00    	mov    0x7d8(%ecx),%eax
  10187e:	83 e0 08             	and    $0x8,%eax
  101881:	85 c0                	test   %eax,%eax
  101883:	74 22                	je     1018a7 <kbd_proc_data+0x16f>
        if ('a' <= c && c <= 'z')
  101885:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  101889:	7e 0c                	jle    101897 <kbd_proc_data+0x15f>
  10188b:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  10188f:	7f 06                	jg     101897 <kbd_proc_data+0x15f>
            c += 'A' - 'a';
  101891:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  101895:	eb 10                	jmp    1018a7 <kbd_proc_data+0x16f>
        else if ('A' <= c && c <= 'Z')
  101897:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  10189b:	7e 0a                	jle    1018a7 <kbd_proc_data+0x16f>
  10189d:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  1018a1:	7f 04                	jg     1018a7 <kbd_proc_data+0x16f>
            c += 'a' - 'A';
  1018a3:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  1018a7:	8b 81 d8 07 00 00    	mov    0x7d8(%ecx),%eax
  1018ad:	f7 d0                	not    %eax
  1018af:	83 e0 06             	and    $0x6,%eax
  1018b2:	85 c0                	test   %eax,%eax
  1018b4:	75 31                	jne    1018e7 <kbd_proc_data+0x1af>
  1018b6:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  1018bd:	75 28                	jne    1018e7 <kbd_proc_data+0x1af>
        cprintf("Rebooting!\n");
  1018bf:	83 ec 0c             	sub    $0xc,%esp
  1018c2:	8d 81 9d 35 ff ff    	lea    -0xca63(%ecx),%eax
  1018c8:	50                   	push   %eax
  1018c9:	89 cb                	mov    %ecx,%ebx
  1018cb:	e8 5e ea ff ff       	call   10032e <cprintf>
  1018d0:	83 c4 10             	add    $0x10,%esp
  1018d3:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  1018d9:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1018dd:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  1018e1:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
  1018e5:	ee                   	out    %al,(%dx)
}
  1018e6:	90                   	nop
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  1018e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1018ea:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1018ed:	c9                   	leave  
  1018ee:	c3                   	ret    

001018ef <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  1018ef:	f3 0f 1e fb          	endbr32 
  1018f3:	55                   	push   %ebp
  1018f4:	89 e5                	mov    %esp,%ebp
  1018f6:	83 ec 08             	sub    $0x8,%esp
  1018f9:	e8 b1 e9 ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  1018fe:	05 52 f0 00 00       	add    $0xf052,%eax
    cons_intr(kbd_proc_data);
  101903:	83 ec 0c             	sub    $0xc,%esp
  101906:	8d 80 e8 0d ff ff    	lea    -0xf218(%eax),%eax
  10190c:	50                   	push   %eax
  10190d:	e8 2a fd ff ff       	call   10163c <cons_intr>
  101912:	83 c4 10             	add    $0x10,%esp
}
  101915:	90                   	nop
  101916:	c9                   	leave  
  101917:	c3                   	ret    

00101918 <kbd_init>:

static void
kbd_init(void) {
  101918:	f3 0f 1e fb          	endbr32 
  10191c:	55                   	push   %ebp
  10191d:	89 e5                	mov    %esp,%ebp
  10191f:	53                   	push   %ebx
  101920:	83 ec 04             	sub    $0x4,%esp
  101923:	e8 8b e9 ff ff       	call   1002b3 <__x86.get_pc_thunk.bx>
  101928:	81 c3 28 f0 00 00    	add    $0xf028,%ebx
    // drain the kbd buffer
    kbd_intr();
  10192e:	e8 bc ff ff ff       	call   1018ef <kbd_intr>
    pic_enable(IRQ_KBD);
  101933:	83 ec 0c             	sub    $0xc,%esp
  101936:	6a 01                	push   $0x1
  101938:	e8 71 01 00 00       	call   101aae <pic_enable>
  10193d:	83 c4 10             	add    $0x10,%esp
}
  101940:	90                   	nop
  101941:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101944:	c9                   	leave  
  101945:	c3                   	ret    

00101946 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  101946:	f3 0f 1e fb          	endbr32 
  10194a:	55                   	push   %ebp
  10194b:	89 e5                	mov    %esp,%ebp
  10194d:	53                   	push   %ebx
  10194e:	83 ec 04             	sub    $0x4,%esp
  101951:	e8 5d e9 ff ff       	call   1002b3 <__x86.get_pc_thunk.bx>
  101956:	81 c3 fa ef 00 00    	add    $0xeffa,%ebx
    cga_init();
  10195c:	e8 5f f7 ff ff       	call   1010c0 <cga_init>
    serial_init();
  101961:	e8 54 f8 ff ff       	call   1011ba <serial_init>
    kbd_init();
  101966:	e8 ad ff ff ff       	call   101918 <kbd_init>
    if (!serial_exists) {
  10196b:	8b 83 b8 05 00 00    	mov    0x5b8(%ebx),%eax
  101971:	85 c0                	test   %eax,%eax
  101973:	75 12                	jne    101987 <cons_init+0x41>
        cprintf("serial port does not exist!!\n");
  101975:	83 ec 0c             	sub    $0xc,%esp
  101978:	8d 83 a9 35 ff ff    	lea    -0xca57(%ebx),%eax
  10197e:	50                   	push   %eax
  10197f:	e8 aa e9 ff ff       	call   10032e <cprintf>
  101984:	83 c4 10             	add    $0x10,%esp
    }
}
  101987:	90                   	nop
  101988:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10198b:	c9                   	leave  
  10198c:	c3                   	ret    

0010198d <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  10198d:	f3 0f 1e fb          	endbr32 
  101991:	55                   	push   %ebp
  101992:	89 e5                	mov    %esp,%ebp
  101994:	83 ec 08             	sub    $0x8,%esp
  101997:	e8 13 e9 ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  10199c:	05 b4 ef 00 00       	add    $0xefb4,%eax
    lpt_putc(c);
  1019a1:	ff 75 08             	pushl  0x8(%ebp)
  1019a4:	e8 9f f9 ff ff       	call   101348 <lpt_putc>
  1019a9:	83 c4 04             	add    $0x4,%esp
    cga_putc(c);
  1019ac:	83 ec 0c             	sub    $0xc,%esp
  1019af:	ff 75 08             	pushl  0x8(%ebp)
  1019b2:	e8 d6 f9 ff ff       	call   10138d <cga_putc>
  1019b7:	83 c4 10             	add    $0x10,%esp
    serial_putc(c);
  1019ba:	83 ec 0c             	sub    $0xc,%esp
  1019bd:	ff 75 08             	pushl  0x8(%ebp)
  1019c0:	e8 32 fc ff ff       	call   1015f7 <serial_putc>
  1019c5:	83 c4 10             	add    $0x10,%esp
}
  1019c8:	90                   	nop
  1019c9:	c9                   	leave  
  1019ca:	c3                   	ret    

001019cb <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  1019cb:	f3 0f 1e fb          	endbr32 
  1019cf:	55                   	push   %ebp
  1019d0:	89 e5                	mov    %esp,%ebp
  1019d2:	53                   	push   %ebx
  1019d3:	83 ec 14             	sub    $0x14,%esp
  1019d6:	e8 d8 e8 ff ff       	call   1002b3 <__x86.get_pc_thunk.bx>
  1019db:	81 c3 75 ef 00 00    	add    $0xef75,%ebx
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1019e1:	e8 1f fd ff ff       	call   101705 <serial_intr>
    kbd_intr();
  1019e6:	e8 04 ff ff ff       	call   1018ef <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1019eb:	8b 93 d0 07 00 00    	mov    0x7d0(%ebx),%edx
  1019f1:	8b 83 d4 07 00 00    	mov    0x7d4(%ebx),%eax
  1019f7:	39 c2                	cmp    %eax,%edx
  1019f9:	74 39                	je     101a34 <cons_getc+0x69>
        c = cons.buf[cons.rpos ++];
  1019fb:	8b 83 d0 07 00 00    	mov    0x7d0(%ebx),%eax
  101a01:	8d 50 01             	lea    0x1(%eax),%edx
  101a04:	89 93 d0 07 00 00    	mov    %edx,0x7d0(%ebx)
  101a0a:	0f b6 84 03 d0 05 00 	movzbl 0x5d0(%ebx,%eax,1),%eax
  101a11:	00 
  101a12:	0f b6 c0             	movzbl %al,%eax
  101a15:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  101a18:	8b 83 d0 07 00 00    	mov    0x7d0(%ebx),%eax
  101a1e:	3d 00 02 00 00       	cmp    $0x200,%eax
  101a23:	75 0a                	jne    101a2f <cons_getc+0x64>
            cons.rpos = 0;
  101a25:	c7 83 d0 07 00 00 00 	movl   $0x0,0x7d0(%ebx)
  101a2c:	00 00 00 
        }
        return c;
  101a2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101a32:	eb 05                	jmp    101a39 <cons_getc+0x6e>
    }
    return 0;
  101a34:	b8 00 00 00 00       	mov    $0x0,%eax
}
  101a39:	83 c4 14             	add    $0x14,%esp
  101a3c:	5b                   	pop    %ebx
  101a3d:	5d                   	pop    %ebp
  101a3e:	c3                   	ret    

00101a3f <__x86.get_pc_thunk.cx>:
  101a3f:	8b 0c 24             	mov    (%esp),%ecx
  101a42:	c3                   	ret    

00101a43 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  101a43:	f3 0f 1e fb          	endbr32 
  101a47:	55                   	push   %ebp
  101a48:	89 e5                	mov    %esp,%ebp
  101a4a:	83 ec 14             	sub    $0x14,%esp
  101a4d:	e8 5d e8 ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  101a52:	05 fe ee 00 00       	add    $0xeefe,%eax
  101a57:	8b 55 08             	mov    0x8(%ebp),%edx
  101a5a:	66 89 55 ec          	mov    %dx,-0x14(%ebp)
    irq_mask = mask;
  101a5e:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
  101a62:	66 89 90 b0 fb ff ff 	mov    %dx,-0x450(%eax)
    if (did_init) {
  101a69:	8b 80 dc 07 00 00    	mov    0x7dc(%eax),%eax
  101a6f:	85 c0                	test   %eax,%eax
  101a71:	74 38                	je     101aab <pic_setmask+0x68>
        outb(IO_PIC1 + 1, mask);
  101a73:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101a77:	0f b6 c0             	movzbl %al,%eax
  101a7a:	66 c7 45 fa 21 00    	movw   $0x21,-0x6(%ebp)
  101a80:	88 45 f9             	mov    %al,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101a83:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101a87:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101a8b:	ee                   	out    %al,(%dx)
}
  101a8c:	90                   	nop
        outb(IO_PIC2 + 1, mask >> 8);
  101a8d:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101a91:	66 c1 e8 08          	shr    $0x8,%ax
  101a95:	0f b6 c0             	movzbl %al,%eax
  101a98:	66 c7 45 fe a1 00    	movw   $0xa1,-0x2(%ebp)
  101a9e:	88 45 fd             	mov    %al,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101aa1:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101aa5:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101aa9:	ee                   	out    %al,(%dx)
}
  101aaa:	90                   	nop
    }
}
  101aab:	90                   	nop
  101aac:	c9                   	leave  
  101aad:	c3                   	ret    

00101aae <pic_enable>:

void
pic_enable(unsigned int irq) {
  101aae:	f3 0f 1e fb          	endbr32 
  101ab2:	55                   	push   %ebp
  101ab3:	89 e5                	mov    %esp,%ebp
  101ab5:	53                   	push   %ebx
  101ab6:	e8 f4 e7 ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  101abb:	05 95 ee 00 00       	add    $0xee95,%eax
    pic_setmask(irq_mask & ~(1 << irq));
  101ac0:	8b 55 08             	mov    0x8(%ebp),%edx
  101ac3:	bb 01 00 00 00       	mov    $0x1,%ebx
  101ac8:	89 d1                	mov    %edx,%ecx
  101aca:	d3 e3                	shl    %cl,%ebx
  101acc:	89 da                	mov    %ebx,%edx
  101ace:	f7 d2                	not    %edx
  101ad0:	0f b7 80 b0 fb ff ff 	movzwl -0x450(%eax),%eax
  101ad7:	21 d0                	and    %edx,%eax
  101ad9:	0f b7 c0             	movzwl %ax,%eax
  101adc:	50                   	push   %eax
  101add:	e8 61 ff ff ff       	call   101a43 <pic_setmask>
  101ae2:	83 c4 04             	add    $0x4,%esp
}
  101ae5:	90                   	nop
  101ae6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101ae9:	c9                   	leave  
  101aea:	c3                   	ret    

00101aeb <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  101aeb:	f3 0f 1e fb          	endbr32 
  101aef:	55                   	push   %ebp
  101af0:	89 e5                	mov    %esp,%ebp
  101af2:	83 ec 40             	sub    $0x40,%esp
  101af5:	e8 45 ff ff ff       	call   101a3f <__x86.get_pc_thunk.cx>
  101afa:	81 c1 56 ee 00 00    	add    $0xee56,%ecx
    did_init = 1;
  101b00:	c7 81 dc 07 00 00 01 	movl   $0x1,0x7dc(%ecx)
  101b07:	00 00 00 
  101b0a:	66 c7 45 ca 21 00    	movw   $0x21,-0x36(%ebp)
  101b10:	c6 45 c9 ff          	movb   $0xff,-0x37(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101b14:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  101b18:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  101b1c:	ee                   	out    %al,(%dx)
}
  101b1d:	90                   	nop
  101b1e:	66 c7 45 ce a1 00    	movw   $0xa1,-0x32(%ebp)
  101b24:	c6 45 cd ff          	movb   $0xff,-0x33(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101b28:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  101b2c:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  101b30:	ee                   	out    %al,(%dx)
}
  101b31:	90                   	nop
  101b32:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  101b38:	c6 45 d1 11          	movb   $0x11,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101b3c:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  101b40:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  101b44:	ee                   	out    %al,(%dx)
}
  101b45:	90                   	nop
  101b46:	66 c7 45 d6 21 00    	movw   $0x21,-0x2a(%ebp)
  101b4c:	c6 45 d5 20          	movb   $0x20,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101b50:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  101b54:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  101b58:	ee                   	out    %al,(%dx)
}
  101b59:	90                   	nop
  101b5a:	66 c7 45 da 21 00    	movw   $0x21,-0x26(%ebp)
  101b60:	c6 45 d9 04          	movb   $0x4,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101b64:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  101b68:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  101b6c:	ee                   	out    %al,(%dx)
}
  101b6d:	90                   	nop
  101b6e:	66 c7 45 de 21 00    	movw   $0x21,-0x22(%ebp)
  101b74:	c6 45 dd 03          	movb   $0x3,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101b78:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101b7c:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  101b80:	ee                   	out    %al,(%dx)
}
  101b81:	90                   	nop
  101b82:	66 c7 45 e2 a0 00    	movw   $0xa0,-0x1e(%ebp)
  101b88:	c6 45 e1 11          	movb   $0x11,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101b8c:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  101b90:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  101b94:	ee                   	out    %al,(%dx)
}
  101b95:	90                   	nop
  101b96:	66 c7 45 e6 a1 00    	movw   $0xa1,-0x1a(%ebp)
  101b9c:	c6 45 e5 28          	movb   $0x28,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101ba0:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101ba4:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101ba8:	ee                   	out    %al,(%dx)
}
  101ba9:	90                   	nop
  101baa:	66 c7 45 ea a1 00    	movw   $0xa1,-0x16(%ebp)
  101bb0:	c6 45 e9 02          	movb   $0x2,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101bb4:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101bb8:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101bbc:	ee                   	out    %al,(%dx)
}
  101bbd:	90                   	nop
  101bbe:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  101bc4:	c6 45 ed 03          	movb   $0x3,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101bc8:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101bcc:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101bd0:	ee                   	out    %al,(%dx)
}
  101bd1:	90                   	nop
  101bd2:	66 c7 45 f2 20 00    	movw   $0x20,-0xe(%ebp)
  101bd8:	c6 45 f1 68          	movb   $0x68,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101bdc:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101be0:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101be4:	ee                   	out    %al,(%dx)
}
  101be5:	90                   	nop
  101be6:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  101bec:	c6 45 f5 0a          	movb   $0xa,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101bf0:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101bf4:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101bf8:	ee                   	out    %al,(%dx)
}
  101bf9:	90                   	nop
  101bfa:	66 c7 45 fa a0 00    	movw   $0xa0,-0x6(%ebp)
  101c00:	c6 45 f9 68          	movb   $0x68,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101c04:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101c08:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101c0c:	ee                   	out    %al,(%dx)
}
  101c0d:	90                   	nop
  101c0e:	66 c7 45 fe a0 00    	movw   $0xa0,-0x2(%ebp)
  101c14:	c6 45 fd 0a          	movb   $0xa,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101c18:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101c1c:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101c20:	ee                   	out    %al,(%dx)
}
  101c21:	90                   	nop
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  101c22:	0f b7 81 b0 fb ff ff 	movzwl -0x450(%ecx),%eax
  101c29:	66 83 f8 ff          	cmp    $0xffff,%ax
  101c2d:	74 13                	je     101c42 <pic_init+0x157>
        pic_setmask(irq_mask);
  101c2f:	0f b7 81 b0 fb ff ff 	movzwl -0x450(%ecx),%eax
  101c36:	0f b7 c0             	movzwl %ax,%eax
  101c39:	50                   	push   %eax
  101c3a:	e8 04 fe ff ff       	call   101a43 <pic_setmask>
  101c3f:	83 c4 04             	add    $0x4,%esp
    }
}
  101c42:	90                   	nop
  101c43:	c9                   	leave  
  101c44:	c3                   	ret    

00101c45 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  101c45:	f3 0f 1e fb          	endbr32 
  101c49:	55                   	push   %ebp
  101c4a:	89 e5                	mov    %esp,%ebp
  101c4c:	e8 5e e6 ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  101c51:	05 ff ec 00 00       	add    $0xecff,%eax
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  101c56:	fb                   	sti    
}
  101c57:	90                   	nop
    sti();
}
  101c58:	90                   	nop
  101c59:	5d                   	pop    %ebp
  101c5a:	c3                   	ret    

00101c5b <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  101c5b:	f3 0f 1e fb          	endbr32 
  101c5f:	55                   	push   %ebp
  101c60:	89 e5                	mov    %esp,%ebp
  101c62:	e8 48 e6 ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  101c67:	05 e9 ec 00 00       	add    $0xece9,%eax

static inline void
cli(void) {
    asm volatile ("cli");
  101c6c:	fa                   	cli    
}
  101c6d:	90                   	nop
    cli();
}
  101c6e:	90                   	nop
  101c6f:	5d                   	pop    %ebp
  101c70:	c3                   	ret    

00101c71 <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  101c71:	f3 0f 1e fb          	endbr32 
  101c75:	55                   	push   %ebp
  101c76:	89 e5                	mov    %esp,%ebp
  101c78:	53                   	push   %ebx
  101c79:	83 ec 04             	sub    $0x4,%esp
  101c7c:	e8 2e e6 ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  101c81:	05 cf ec 00 00       	add    $0xeccf,%eax
    cprintf("%d ticks\n",TICK_NUM);
  101c86:	83 ec 08             	sub    $0x8,%esp
  101c89:	6a 64                	push   $0x64
  101c8b:	8d 90 c7 35 ff ff    	lea    -0xca39(%eax),%edx
  101c91:	52                   	push   %edx
  101c92:	89 c3                	mov    %eax,%ebx
  101c94:	e8 95 e6 ff ff       	call   10032e <cprintf>
  101c99:	83 c4 10             	add    $0x10,%esp
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  101c9c:	90                   	nop
  101c9d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101ca0:	c9                   	leave  
  101ca1:	c3                   	ret    

00101ca2 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101ca2:	f3 0f 1e fb          	endbr32 
  101ca6:	55                   	push   %ebp
  101ca7:	89 e5                	mov    %esp,%ebp
  101ca9:	83 ec 10             	sub    $0x10,%esp
  101cac:	e8 fe e5 ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  101cb1:	05 9f ec 00 00       	add    $0xec9f,%eax
	//中断服务例程表存放在vectors内(kern/trap/vector.S) —— uintptr_t __vectors[]
	extern uintptr_t __vectors[];   //定义存放例程入口的容器
	int i =0;
  101cb6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	for (i=0;i<256;i++){  //给idt数组赋值
  101cbd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101cc4:	e9 c7 00 00 00       	jmp    101d90 <idt_init+0xee>
		SETGATE(idt[i],0,GD_KTEXT,__vectors[i],DPL_KERNEL);      //属于内部异常还是外部中断
  101cc9:	c7 c2 02 05 11 00    	mov    $0x110502,%edx
  101ccf:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  101cd2:	8b 14 8a             	mov    (%edx,%ecx,4),%edx
  101cd5:	89 d1                	mov    %edx,%ecx
  101cd7:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101cda:	66 89 8c d0 f0 07 00 	mov    %cx,0x7f0(%eax,%edx,8)
  101ce1:	00 
  101ce2:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101ce5:	66 c7 84 d0 f2 07 00 	movw   $0x8,0x7f2(%eax,%edx,8)
  101cec:	00 08 00 
  101cef:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101cf2:	0f b6 8c d0 f4 07 00 	movzbl 0x7f4(%eax,%edx,8),%ecx
  101cf9:	00 
  101cfa:	83 e1 e0             	and    $0xffffffe0,%ecx
  101cfd:	88 8c d0 f4 07 00 00 	mov    %cl,0x7f4(%eax,%edx,8)
  101d04:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101d07:	0f b6 8c d0 f4 07 00 	movzbl 0x7f4(%eax,%edx,8),%ecx
  101d0e:	00 
  101d0f:	83 e1 1f             	and    $0x1f,%ecx
  101d12:	88 8c d0 f4 07 00 00 	mov    %cl,0x7f4(%eax,%edx,8)
  101d19:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101d1c:	0f b6 8c d0 f5 07 00 	movzbl 0x7f5(%eax,%edx,8),%ecx
  101d23:	00 
  101d24:	83 e1 f0             	and    $0xfffffff0,%ecx
  101d27:	83 c9 0e             	or     $0xe,%ecx
  101d2a:	88 8c d0 f5 07 00 00 	mov    %cl,0x7f5(%eax,%edx,8)
  101d31:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101d34:	0f b6 8c d0 f5 07 00 	movzbl 0x7f5(%eax,%edx,8),%ecx
  101d3b:	00 
  101d3c:	83 e1 ef             	and    $0xffffffef,%ecx
  101d3f:	88 8c d0 f5 07 00 00 	mov    %cl,0x7f5(%eax,%edx,8)
  101d46:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101d49:	0f b6 8c d0 f5 07 00 	movzbl 0x7f5(%eax,%edx,8),%ecx
  101d50:	00 
  101d51:	83 e1 9f             	and    $0xffffff9f,%ecx
  101d54:	88 8c d0 f5 07 00 00 	mov    %cl,0x7f5(%eax,%edx,8)
  101d5b:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101d5e:	0f b6 8c d0 f5 07 00 	movzbl 0x7f5(%eax,%edx,8),%ecx
  101d65:	00 
  101d66:	83 c9 80             	or     $0xffffff80,%ecx
  101d69:	88 8c d0 f5 07 00 00 	mov    %cl,0x7f5(%eax,%edx,8)
  101d70:	c7 c2 02 05 11 00    	mov    $0x110502,%edx
  101d76:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  101d79:	8b 14 8a             	mov    (%edx,%ecx,4),%edx
  101d7c:	c1 ea 10             	shr    $0x10,%edx
  101d7f:	89 d1                	mov    %edx,%ecx
  101d81:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101d84:	66 89 8c d0 f6 07 00 	mov    %cx,0x7f6(%eax,%edx,8)
  101d8b:	00 
	for (i=0;i<256;i++){  //给idt数组赋值
  101d8c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101d90:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  101d97:	0f 8e 2c ff ff ff    	jle    101cc9 <idt_init+0x27>
		
	}
	SETGATE(idt[T_SWITCH_TOK], 0, GD_KTEXT, __vectors[T_SWITCH_TOK], DPL_USER);
  101d9d:	c7 c2 02 05 11 00    	mov    $0x110502,%edx
  101da3:	8b 92 e4 01 00 00    	mov    0x1e4(%edx),%edx
  101da9:	66 89 90 b8 0b 00 00 	mov    %dx,0xbb8(%eax)
  101db0:	66 c7 80 ba 0b 00 00 	movw   $0x8,0xbba(%eax)
  101db7:	08 00 
  101db9:	0f b6 90 bc 0b 00 00 	movzbl 0xbbc(%eax),%edx
  101dc0:	83 e2 e0             	and    $0xffffffe0,%edx
  101dc3:	88 90 bc 0b 00 00    	mov    %dl,0xbbc(%eax)
  101dc9:	0f b6 90 bc 0b 00 00 	movzbl 0xbbc(%eax),%edx
  101dd0:	83 e2 1f             	and    $0x1f,%edx
  101dd3:	88 90 bc 0b 00 00    	mov    %dl,0xbbc(%eax)
  101dd9:	0f b6 90 bd 0b 00 00 	movzbl 0xbbd(%eax),%edx
  101de0:	83 e2 f0             	and    $0xfffffff0,%edx
  101de3:	83 ca 0e             	or     $0xe,%edx
  101de6:	88 90 bd 0b 00 00    	mov    %dl,0xbbd(%eax)
  101dec:	0f b6 90 bd 0b 00 00 	movzbl 0xbbd(%eax),%edx
  101df3:	83 e2 ef             	and    $0xffffffef,%edx
  101df6:	88 90 bd 0b 00 00    	mov    %dl,0xbbd(%eax)
  101dfc:	0f b6 90 bd 0b 00 00 	movzbl 0xbbd(%eax),%edx
  101e03:	83 ca 60             	or     $0x60,%edx
  101e06:	88 90 bd 0b 00 00    	mov    %dl,0xbbd(%eax)
  101e0c:	0f b6 90 bd 0b 00 00 	movzbl 0xbbd(%eax),%edx
  101e13:	83 ca 80             	or     $0xffffff80,%edx
  101e16:	88 90 bd 0b 00 00    	mov    %dl,0xbbd(%eax)
  101e1c:	c7 c2 02 05 11 00    	mov    $0x110502,%edx
  101e22:	8b 92 e4 01 00 00    	mov    0x1e4(%edx),%edx
  101e28:	c1 ea 10             	shr    $0x10,%edx
  101e2b:	66 89 90 be 0b 00 00 	mov    %dx,0xbbe(%eax)
  101e32:	8d 80 50 00 00 00    	lea    0x50(%eax),%eax
  101e38:	89 45 f8             	mov    %eax,-0x8(%ebp)
    asm volatile ("lidt (%0)" :: "r" (pd));
  101e3b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101e3e:	0f 01 18             	lidtl  (%eax)
}
  101e41:	90                   	nop
      *     Can you see idt[256] in this file? Yes, it's IDT! you can use SETGATE macro to setup each item of IDT
      * (3) After setup the contents of IDT, you will let CPU know where is the IDT by using 'lidt' instruction.
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
}
  101e42:	90                   	nop
  101e43:	c9                   	leave  
  101e44:	c3                   	ret    

00101e45 <trapname>:

static const char *
trapname(int trapno) {
  101e45:	f3 0f 1e fb          	endbr32 
  101e49:	55                   	push   %ebp
  101e4a:	89 e5                	mov    %esp,%ebp
  101e4c:	e8 5e e4 ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  101e51:	05 ff ea 00 00       	add    $0xeaff,%eax
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  101e56:	8b 55 08             	mov    0x8(%ebp),%edx
  101e59:	83 fa 13             	cmp    $0x13,%edx
  101e5c:	77 0c                	ja     101e6a <trapname+0x25>
        return excnames[trapno];
  101e5e:	8b 55 08             	mov    0x8(%ebp),%edx
  101e61:	8b 84 90 f0 00 00 00 	mov    0xf0(%eax,%edx,4),%eax
  101e68:	eb 1a                	jmp    101e84 <trapname+0x3f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  101e6a:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  101e6e:	7e 0e                	jle    101e7e <trapname+0x39>
  101e70:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  101e74:	7f 08                	jg     101e7e <trapname+0x39>
        return "Hardware Interrupt";
  101e76:	8d 80 d1 35 ff ff    	lea    -0xca2f(%eax),%eax
  101e7c:	eb 06                	jmp    101e84 <trapname+0x3f>
    }
    return "(unknown trap)";
  101e7e:	8d 80 e4 35 ff ff    	lea    -0xca1c(%eax),%eax
}
  101e84:	5d                   	pop    %ebp
  101e85:	c3                   	ret    

00101e86 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  101e86:	f3 0f 1e fb          	endbr32 
  101e8a:	55                   	push   %ebp
  101e8b:	89 e5                	mov    %esp,%ebp
  101e8d:	e8 1d e4 ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  101e92:	05 be ea 00 00       	add    $0xeabe,%eax
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  101e97:	8b 45 08             	mov    0x8(%ebp),%eax
  101e9a:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101e9e:	66 83 f8 08          	cmp    $0x8,%ax
  101ea2:	0f 94 c0             	sete   %al
  101ea5:	0f b6 c0             	movzbl %al,%eax
}
  101ea8:	5d                   	pop    %ebp
  101ea9:	c3                   	ret    

00101eaa <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  101eaa:	f3 0f 1e fb          	endbr32 
  101eae:	55                   	push   %ebp
  101eaf:	89 e5                	mov    %esp,%ebp
  101eb1:	53                   	push   %ebx
  101eb2:	83 ec 14             	sub    $0x14,%esp
  101eb5:	e8 f9 e3 ff ff       	call   1002b3 <__x86.get_pc_thunk.bx>
  101eba:	81 c3 96 ea 00 00    	add    $0xea96,%ebx
    cprintf("trapframe at %p\n", tf);
  101ec0:	83 ec 08             	sub    $0x8,%esp
  101ec3:	ff 75 08             	pushl  0x8(%ebp)
  101ec6:	8d 83 25 36 ff ff    	lea    -0xc9db(%ebx),%eax
  101ecc:	50                   	push   %eax
  101ecd:	e8 5c e4 ff ff       	call   10032e <cprintf>
  101ed2:	83 c4 10             	add    $0x10,%esp
    print_regs(&tf->tf_regs);
  101ed5:	8b 45 08             	mov    0x8(%ebp),%eax
  101ed8:	83 ec 0c             	sub    $0xc,%esp
  101edb:	50                   	push   %eax
  101edc:	e8 d1 01 00 00       	call   1020b2 <print_regs>
  101ee1:	83 c4 10             	add    $0x10,%esp
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101ee4:	8b 45 08             	mov    0x8(%ebp),%eax
  101ee7:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101eeb:	0f b7 c0             	movzwl %ax,%eax
  101eee:	83 ec 08             	sub    $0x8,%esp
  101ef1:	50                   	push   %eax
  101ef2:	8d 83 36 36 ff ff    	lea    -0xc9ca(%ebx),%eax
  101ef8:	50                   	push   %eax
  101ef9:	e8 30 e4 ff ff       	call   10032e <cprintf>
  101efe:	83 c4 10             	add    $0x10,%esp
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101f01:	8b 45 08             	mov    0x8(%ebp),%eax
  101f04:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101f08:	0f b7 c0             	movzwl %ax,%eax
  101f0b:	83 ec 08             	sub    $0x8,%esp
  101f0e:	50                   	push   %eax
  101f0f:	8d 83 49 36 ff ff    	lea    -0xc9b7(%ebx),%eax
  101f15:	50                   	push   %eax
  101f16:	e8 13 e4 ff ff       	call   10032e <cprintf>
  101f1b:	83 c4 10             	add    $0x10,%esp
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101f1e:	8b 45 08             	mov    0x8(%ebp),%eax
  101f21:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101f25:	0f b7 c0             	movzwl %ax,%eax
  101f28:	83 ec 08             	sub    $0x8,%esp
  101f2b:	50                   	push   %eax
  101f2c:	8d 83 5c 36 ff ff    	lea    -0xc9a4(%ebx),%eax
  101f32:	50                   	push   %eax
  101f33:	e8 f6 e3 ff ff       	call   10032e <cprintf>
  101f38:	83 c4 10             	add    $0x10,%esp
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101f3b:	8b 45 08             	mov    0x8(%ebp),%eax
  101f3e:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101f42:	0f b7 c0             	movzwl %ax,%eax
  101f45:	83 ec 08             	sub    $0x8,%esp
  101f48:	50                   	push   %eax
  101f49:	8d 83 6f 36 ff ff    	lea    -0xc991(%ebx),%eax
  101f4f:	50                   	push   %eax
  101f50:	e8 d9 e3 ff ff       	call   10032e <cprintf>
  101f55:	83 c4 10             	add    $0x10,%esp
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101f58:	8b 45 08             	mov    0x8(%ebp),%eax
  101f5b:	8b 40 30             	mov    0x30(%eax),%eax
  101f5e:	83 ec 0c             	sub    $0xc,%esp
  101f61:	50                   	push   %eax
  101f62:	e8 de fe ff ff       	call   101e45 <trapname>
  101f67:	83 c4 10             	add    $0x10,%esp
  101f6a:	8b 55 08             	mov    0x8(%ebp),%edx
  101f6d:	8b 52 30             	mov    0x30(%edx),%edx
  101f70:	83 ec 04             	sub    $0x4,%esp
  101f73:	50                   	push   %eax
  101f74:	52                   	push   %edx
  101f75:	8d 83 82 36 ff ff    	lea    -0xc97e(%ebx),%eax
  101f7b:	50                   	push   %eax
  101f7c:	e8 ad e3 ff ff       	call   10032e <cprintf>
  101f81:	83 c4 10             	add    $0x10,%esp
    cprintf("  err  0x%08x\n", tf->tf_err);
  101f84:	8b 45 08             	mov    0x8(%ebp),%eax
  101f87:	8b 40 34             	mov    0x34(%eax),%eax
  101f8a:	83 ec 08             	sub    $0x8,%esp
  101f8d:	50                   	push   %eax
  101f8e:	8d 83 94 36 ff ff    	lea    -0xc96c(%ebx),%eax
  101f94:	50                   	push   %eax
  101f95:	e8 94 e3 ff ff       	call   10032e <cprintf>
  101f9a:	83 c4 10             	add    $0x10,%esp
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101f9d:	8b 45 08             	mov    0x8(%ebp),%eax
  101fa0:	8b 40 38             	mov    0x38(%eax),%eax
  101fa3:	83 ec 08             	sub    $0x8,%esp
  101fa6:	50                   	push   %eax
  101fa7:	8d 83 a3 36 ff ff    	lea    -0xc95d(%ebx),%eax
  101fad:	50                   	push   %eax
  101fae:	e8 7b e3 ff ff       	call   10032e <cprintf>
  101fb3:	83 c4 10             	add    $0x10,%esp
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101fb6:	8b 45 08             	mov    0x8(%ebp),%eax
  101fb9:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101fbd:	0f b7 c0             	movzwl %ax,%eax
  101fc0:	83 ec 08             	sub    $0x8,%esp
  101fc3:	50                   	push   %eax
  101fc4:	8d 83 b2 36 ff ff    	lea    -0xc94e(%ebx),%eax
  101fca:	50                   	push   %eax
  101fcb:	e8 5e e3 ff ff       	call   10032e <cprintf>
  101fd0:	83 c4 10             	add    $0x10,%esp
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101fd3:	8b 45 08             	mov    0x8(%ebp),%eax
  101fd6:	8b 40 40             	mov    0x40(%eax),%eax
  101fd9:	83 ec 08             	sub    $0x8,%esp
  101fdc:	50                   	push   %eax
  101fdd:	8d 83 c5 36 ff ff    	lea    -0xc93b(%ebx),%eax
  101fe3:	50                   	push   %eax
  101fe4:	e8 45 e3 ff ff       	call   10032e <cprintf>
  101fe9:	83 c4 10             	add    $0x10,%esp

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101fec:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101ff3:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101ffa:	eb 41                	jmp    10203d <print_trapframe+0x193>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101ffc:	8b 45 08             	mov    0x8(%ebp),%eax
  101fff:	8b 50 40             	mov    0x40(%eax),%edx
  102002:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102005:	21 d0                	and    %edx,%eax
  102007:	85 c0                	test   %eax,%eax
  102009:	74 2b                	je     102036 <print_trapframe+0x18c>
  10200b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10200e:	8b 84 83 70 00 00 00 	mov    0x70(%ebx,%eax,4),%eax
  102015:	85 c0                	test   %eax,%eax
  102017:	74 1d                	je     102036 <print_trapframe+0x18c>
            cprintf("%s,", IA32flags[i]);
  102019:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10201c:	8b 84 83 70 00 00 00 	mov    0x70(%ebx,%eax,4),%eax
  102023:	83 ec 08             	sub    $0x8,%esp
  102026:	50                   	push   %eax
  102027:	8d 83 d4 36 ff ff    	lea    -0xc92c(%ebx),%eax
  10202d:	50                   	push   %eax
  10202e:	e8 fb e2 ff ff       	call   10032e <cprintf>
  102033:	83 c4 10             	add    $0x10,%esp
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  102036:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10203a:	d1 65 f0             	shll   -0x10(%ebp)
  10203d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102040:	83 f8 17             	cmp    $0x17,%eax
  102043:	76 b7                	jbe    101ffc <print_trapframe+0x152>
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  102045:	8b 45 08             	mov    0x8(%ebp),%eax
  102048:	8b 40 40             	mov    0x40(%eax),%eax
  10204b:	c1 e8 0c             	shr    $0xc,%eax
  10204e:	83 e0 03             	and    $0x3,%eax
  102051:	83 ec 08             	sub    $0x8,%esp
  102054:	50                   	push   %eax
  102055:	8d 83 d8 36 ff ff    	lea    -0xc928(%ebx),%eax
  10205b:	50                   	push   %eax
  10205c:	e8 cd e2 ff ff       	call   10032e <cprintf>
  102061:	83 c4 10             	add    $0x10,%esp

    if (!trap_in_kernel(tf)) {
  102064:	83 ec 0c             	sub    $0xc,%esp
  102067:	ff 75 08             	pushl  0x8(%ebp)
  10206a:	e8 17 fe ff ff       	call   101e86 <trap_in_kernel>
  10206f:	83 c4 10             	add    $0x10,%esp
  102072:	85 c0                	test   %eax,%eax
  102074:	75 36                	jne    1020ac <print_trapframe+0x202>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  102076:	8b 45 08             	mov    0x8(%ebp),%eax
  102079:	8b 40 44             	mov    0x44(%eax),%eax
  10207c:	83 ec 08             	sub    $0x8,%esp
  10207f:	50                   	push   %eax
  102080:	8d 83 e1 36 ff ff    	lea    -0xc91f(%ebx),%eax
  102086:	50                   	push   %eax
  102087:	e8 a2 e2 ff ff       	call   10032e <cprintf>
  10208c:	83 c4 10             	add    $0x10,%esp
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  10208f:	8b 45 08             	mov    0x8(%ebp),%eax
  102092:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  102096:	0f b7 c0             	movzwl %ax,%eax
  102099:	83 ec 08             	sub    $0x8,%esp
  10209c:	50                   	push   %eax
  10209d:	8d 83 f0 36 ff ff    	lea    -0xc910(%ebx),%eax
  1020a3:	50                   	push   %eax
  1020a4:	e8 85 e2 ff ff       	call   10032e <cprintf>
  1020a9:	83 c4 10             	add    $0x10,%esp
    }
}
  1020ac:	90                   	nop
  1020ad:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1020b0:	c9                   	leave  
  1020b1:	c3                   	ret    

001020b2 <print_regs>:

void
print_regs(struct pushregs *regs) {
  1020b2:	f3 0f 1e fb          	endbr32 
  1020b6:	55                   	push   %ebp
  1020b7:	89 e5                	mov    %esp,%ebp
  1020b9:	53                   	push   %ebx
  1020ba:	83 ec 04             	sub    $0x4,%esp
  1020bd:	e8 f1 e1 ff ff       	call   1002b3 <__x86.get_pc_thunk.bx>
  1020c2:	81 c3 8e e8 00 00    	add    $0xe88e,%ebx
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  1020c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1020cb:	8b 00                	mov    (%eax),%eax
  1020cd:	83 ec 08             	sub    $0x8,%esp
  1020d0:	50                   	push   %eax
  1020d1:	8d 83 03 37 ff ff    	lea    -0xc8fd(%ebx),%eax
  1020d7:	50                   	push   %eax
  1020d8:	e8 51 e2 ff ff       	call   10032e <cprintf>
  1020dd:	83 c4 10             	add    $0x10,%esp
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  1020e0:	8b 45 08             	mov    0x8(%ebp),%eax
  1020e3:	8b 40 04             	mov    0x4(%eax),%eax
  1020e6:	83 ec 08             	sub    $0x8,%esp
  1020e9:	50                   	push   %eax
  1020ea:	8d 83 12 37 ff ff    	lea    -0xc8ee(%ebx),%eax
  1020f0:	50                   	push   %eax
  1020f1:	e8 38 e2 ff ff       	call   10032e <cprintf>
  1020f6:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  1020f9:	8b 45 08             	mov    0x8(%ebp),%eax
  1020fc:	8b 40 08             	mov    0x8(%eax),%eax
  1020ff:	83 ec 08             	sub    $0x8,%esp
  102102:	50                   	push   %eax
  102103:	8d 83 21 37 ff ff    	lea    -0xc8df(%ebx),%eax
  102109:	50                   	push   %eax
  10210a:	e8 1f e2 ff ff       	call   10032e <cprintf>
  10210f:	83 c4 10             	add    $0x10,%esp
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  102112:	8b 45 08             	mov    0x8(%ebp),%eax
  102115:	8b 40 0c             	mov    0xc(%eax),%eax
  102118:	83 ec 08             	sub    $0x8,%esp
  10211b:	50                   	push   %eax
  10211c:	8d 83 30 37 ff ff    	lea    -0xc8d0(%ebx),%eax
  102122:	50                   	push   %eax
  102123:	e8 06 e2 ff ff       	call   10032e <cprintf>
  102128:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  10212b:	8b 45 08             	mov    0x8(%ebp),%eax
  10212e:	8b 40 10             	mov    0x10(%eax),%eax
  102131:	83 ec 08             	sub    $0x8,%esp
  102134:	50                   	push   %eax
  102135:	8d 83 3f 37 ff ff    	lea    -0xc8c1(%ebx),%eax
  10213b:	50                   	push   %eax
  10213c:	e8 ed e1 ff ff       	call   10032e <cprintf>
  102141:	83 c4 10             	add    $0x10,%esp
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  102144:	8b 45 08             	mov    0x8(%ebp),%eax
  102147:	8b 40 14             	mov    0x14(%eax),%eax
  10214a:	83 ec 08             	sub    $0x8,%esp
  10214d:	50                   	push   %eax
  10214e:	8d 83 4e 37 ff ff    	lea    -0xc8b2(%ebx),%eax
  102154:	50                   	push   %eax
  102155:	e8 d4 e1 ff ff       	call   10032e <cprintf>
  10215a:	83 c4 10             	add    $0x10,%esp
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  10215d:	8b 45 08             	mov    0x8(%ebp),%eax
  102160:	8b 40 18             	mov    0x18(%eax),%eax
  102163:	83 ec 08             	sub    $0x8,%esp
  102166:	50                   	push   %eax
  102167:	8d 83 5d 37 ff ff    	lea    -0xc8a3(%ebx),%eax
  10216d:	50                   	push   %eax
  10216e:	e8 bb e1 ff ff       	call   10032e <cprintf>
  102173:	83 c4 10             	add    $0x10,%esp
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  102176:	8b 45 08             	mov    0x8(%ebp),%eax
  102179:	8b 40 1c             	mov    0x1c(%eax),%eax
  10217c:	83 ec 08             	sub    $0x8,%esp
  10217f:	50                   	push   %eax
  102180:	8d 83 6c 37 ff ff    	lea    -0xc894(%ebx),%eax
  102186:	50                   	push   %eax
  102187:	e8 a2 e1 ff ff       	call   10032e <cprintf>
  10218c:	83 c4 10             	add    $0x10,%esp
}
  10218f:	90                   	nop
  102190:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  102193:	c9                   	leave  
  102194:	c3                   	ret    

00102195 <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  102195:	f3 0f 1e fb          	endbr32 
  102199:	55                   	push   %ebp
  10219a:	89 e5                	mov    %esp,%ebp
  10219c:	53                   	push   %ebx
  10219d:	83 ec 14             	sub    $0x14,%esp
  1021a0:	e8 0e e1 ff ff       	call   1002b3 <__x86.get_pc_thunk.bx>
  1021a5:	81 c3 ab e7 00 00    	add    $0xe7ab,%ebx
    char c;

    switch (tf->tf_trapno) {
  1021ab:	8b 45 08             	mov    0x8(%ebp),%eax
  1021ae:	8b 40 30             	mov    0x30(%eax),%eax
  1021b1:	83 f8 79             	cmp    $0x79,%eax
  1021b4:	0f 84 48 01 00 00    	je     102302 <trap_dispatch+0x16d>
  1021ba:	83 f8 79             	cmp    $0x79,%eax
  1021bd:	0f 87 91 01 00 00    	ja     102354 <trap_dispatch+0x1bf>
  1021c3:	83 f8 78             	cmp    $0x78,%eax
  1021c6:	0f 84 e1 00 00 00    	je     1022ad <trap_dispatch+0x118>
  1021cc:	83 f8 78             	cmp    $0x78,%eax
  1021cf:	0f 87 7f 01 00 00    	ja     102354 <trap_dispatch+0x1bf>
  1021d5:	83 f8 2f             	cmp    $0x2f,%eax
  1021d8:	0f 87 76 01 00 00    	ja     102354 <trap_dispatch+0x1bf>
  1021de:	83 f8 2e             	cmp    $0x2e,%eax
  1021e1:	0f 83 a7 01 00 00    	jae    10238e <trap_dispatch+0x1f9>
  1021e7:	83 f8 24             	cmp    $0x24,%eax
  1021ea:	74 6f                	je     10225b <trap_dispatch+0xc6>
  1021ec:	83 f8 24             	cmp    $0x24,%eax
  1021ef:	0f 87 5f 01 00 00    	ja     102354 <trap_dispatch+0x1bf>
  1021f5:	83 f8 20             	cmp    $0x20,%eax
  1021f8:	74 0e                	je     102208 <trap_dispatch+0x73>
  1021fa:	83 f8 21             	cmp    $0x21,%eax
  1021fd:	0f 84 81 00 00 00    	je     102284 <trap_dispatch+0xef>
  102203:	e9 4c 01 00 00       	jmp    102354 <trap_dispatch+0x1bf>
    case IRQ_OFFSET + IRQ_TIMER:
    //根据什么类型的中断发生，进行相应的例程处理（中断处理机制）
    //发生时间中断时，记录全局变量
	    ticks+=1;                          //次数计数
  102208:	c7 c0 a8 19 11 00    	mov    $0x1119a8,%eax
  10220e:	8b 00                	mov    (%eax),%eax
  102210:	8d 50 01             	lea    0x1(%eax),%edx
  102213:	c7 c0 a8 19 11 00    	mov    $0x1119a8,%eax
  102219:	89 10                	mov    %edx,(%eax)
	    if(ticks == TICK_NUM){
  10221b:	c7 c0 a8 19 11 00    	mov    $0x1119a8,%eax
  102221:	8b 00                	mov    (%eax),%eax
  102223:	83 f8 64             	cmp    $0x64,%eax
  102226:	0f 85 65 01 00 00    	jne    102391 <trap_dispatch+0x1fc>
	    	ticks%=TICK_NUM;  //ticks=0    //对最大值取余
  10222c:	c7 c0 a8 19 11 00    	mov    $0x1119a8,%eax
  102232:	8b 08                	mov    (%eax),%ecx
  102234:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  102239:	89 c8                	mov    %ecx,%eax
  10223b:	f7 e2                	mul    %edx
  10223d:	89 d0                	mov    %edx,%eax
  10223f:	c1 e8 05             	shr    $0x5,%eax
  102242:	6b c0 64             	imul   $0x64,%eax,%eax
  102245:	29 c1                	sub    %eax,%ecx
  102247:	89 c8                	mov    %ecx,%eax
  102249:	c7 c2 a8 19 11 00    	mov    $0x1119a8,%edx
  10224f:	89 02                	mov    %eax,(%edx)
	    	print_ticks();
  102251:	e8 1b fa ff ff       	call   101c71 <print_ticks>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        break;
  102256:	e9 36 01 00 00       	jmp    102391 <trap_dispatch+0x1fc>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  10225b:	e8 6b f7 ff ff       	call   1019cb <cons_getc>
  102260:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  102263:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  102267:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  10226b:	83 ec 04             	sub    $0x4,%esp
  10226e:	52                   	push   %edx
  10226f:	50                   	push   %eax
  102270:	8d 83 7b 37 ff ff    	lea    -0xc885(%ebx),%eax
  102276:	50                   	push   %eax
  102277:	e8 b2 e0 ff ff       	call   10032e <cprintf>
  10227c:	83 c4 10             	add    $0x10,%esp
        break;
  10227f:	e9 14 01 00 00       	jmp    102398 <trap_dispatch+0x203>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  102284:	e8 42 f7 ff ff       	call   1019cb <cons_getc>
  102289:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  10228c:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  102290:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  102294:	83 ec 04             	sub    $0x4,%esp
  102297:	52                   	push   %edx
  102298:	50                   	push   %eax
  102299:	8d 83 8d 37 ff ff    	lea    -0xc873(%ebx),%eax
  10229f:	50                   	push   %eax
  1022a0:	e8 89 e0 ff ff       	call   10032e <cprintf>
  1022a5:	83 c4 10             	add    $0x10,%esp
        break;
  1022a8:	e9 eb 00 00 00       	jmp    102398 <trap_dispatch+0x203>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    	if (tf->tf_cs !=USER_CS){
  1022ad:	8b 45 08             	mov    0x8(%ebp),%eax
  1022b0:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  1022b4:	66 83 f8 1b          	cmp    $0x1b,%ax
  1022b8:	0f 84 d6 00 00 00    	je     102394 <trap_dispatch+0x1ff>
    		tf->tf_cs = USER_CS;
  1022be:	8b 45 08             	mov    0x8(%ebp),%eax
  1022c1:	66 c7 40 3c 1b 00    	movw   $0x1b,0x3c(%eax)
    		tf->tf_ds = tf->tf_es = tf->tf_ss = USER_DS;
  1022c7:	8b 45 08             	mov    0x8(%ebp),%eax
  1022ca:	66 c7 40 48 23 00    	movw   $0x23,0x48(%eax)
  1022d0:	8b 45 08             	mov    0x8(%ebp),%eax
  1022d3:	0f b7 50 48          	movzwl 0x48(%eax),%edx
  1022d7:	8b 45 08             	mov    0x8(%ebp),%eax
  1022da:	66 89 50 28          	mov    %dx,0x28(%eax)
  1022de:	8b 45 08             	mov    0x8(%ebp),%eax
  1022e1:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  1022e5:	8b 45 08             	mov    0x8(%ebp),%eax
  1022e8:	66 89 50 2c          	mov    %dx,0x2c(%eax)
    		tf->tf_eflags |= FL_IOPL_MASK;
  1022ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1022ef:	8b 40 40             	mov    0x40(%eax),%eax
  1022f2:	80 cc 30             	or     $0x30,%ah
  1022f5:	89 c2                	mov    %eax,%edx
  1022f7:	8b 45 08             	mov    0x8(%ebp),%eax
  1022fa:	89 50 40             	mov    %edx,0x40(%eax)
    	}
    	break;
  1022fd:	e9 92 00 00 00       	jmp    102394 <trap_dispatch+0x1ff>
    case T_SWITCH_TOK:
    	if(tf->tf_cs != KERNEL_CS){
  102302:	8b 45 08             	mov    0x8(%ebp),%eax
  102305:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  102309:	66 83 f8 08          	cmp    $0x8,%ax
  10230d:	0f 84 84 00 00 00    	je     102397 <trap_dispatch+0x202>
    		tf->tf_cs = KERNEL_CS;
  102313:	8b 45 08             	mov    0x8(%ebp),%eax
  102316:	66 c7 40 3c 08 00    	movw   $0x8,0x3c(%eax)
    		tf->tf_ds = tf->tf_es = tf->tf_ss = KERNEL_DS;
  10231c:	8b 45 08             	mov    0x8(%ebp),%eax
  10231f:	66 c7 40 48 10 00    	movw   $0x10,0x48(%eax)
  102325:	8b 45 08             	mov    0x8(%ebp),%eax
  102328:	0f b7 50 48          	movzwl 0x48(%eax),%edx
  10232c:	8b 45 08             	mov    0x8(%ebp),%eax
  10232f:	66 89 50 28          	mov    %dx,0x28(%eax)
  102333:	8b 45 08             	mov    0x8(%ebp),%eax
  102336:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  10233a:	8b 45 08             	mov    0x8(%ebp),%eax
  10233d:	66 89 50 2c          	mov    %dx,0x2c(%eax)
    		tf->tf_eflags &= ~FL_IOPL_MASK;
  102341:	8b 45 08             	mov    0x8(%ebp),%eax
  102344:	8b 40 40             	mov    0x40(%eax),%eax
  102347:	80 e4 cf             	and    $0xcf,%ah
  10234a:	89 c2                	mov    %eax,%edx
  10234c:	8b 45 08             	mov    0x8(%ebp),%eax
  10234f:	89 50 40             	mov    %edx,0x40(%eax)
    	}
        //panic("T_SWITCH_** ??\n");
        break;
  102352:	eb 43                	jmp    102397 <trap_dispatch+0x202>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  102354:	8b 45 08             	mov    0x8(%ebp),%eax
  102357:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  10235b:	0f b7 c0             	movzwl %ax,%eax
  10235e:	83 e0 03             	and    $0x3,%eax
  102361:	85 c0                	test   %eax,%eax
  102363:	75 33                	jne    102398 <trap_dispatch+0x203>
            print_trapframe(tf);
  102365:	83 ec 0c             	sub    $0xc,%esp
  102368:	ff 75 08             	pushl  0x8(%ebp)
  10236b:	e8 3a fb ff ff       	call   101eaa <print_trapframe>
  102370:	83 c4 10             	add    $0x10,%esp
            panic("unexpected trap in kernel.\n");
  102373:	83 ec 04             	sub    $0x4,%esp
  102376:	8d 83 9c 37 ff ff    	lea    -0xc864(%ebx),%eax
  10237c:	50                   	push   %eax
  10237d:	68 cd 00 00 00       	push   $0xcd
  102382:	8d 83 b8 37 ff ff    	lea    -0xc848(%ebx),%eax
  102388:	50                   	push   %eax
  102389:	e8 65 e1 ff ff       	call   1004f3 <__panic>
        break;
  10238e:	90                   	nop
  10238f:	eb 07                	jmp    102398 <trap_dispatch+0x203>
        break;
  102391:	90                   	nop
  102392:	eb 04                	jmp    102398 <trap_dispatch+0x203>
    	break;
  102394:	90                   	nop
  102395:	eb 01                	jmp    102398 <trap_dispatch+0x203>
        break;
  102397:	90                   	nop
        }
    }
}
  102398:	90                   	nop
  102399:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10239c:	c9                   	leave  
  10239d:	c3                   	ret    

0010239e <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  10239e:	f3 0f 1e fb          	endbr32 
  1023a2:	55                   	push   %ebp
  1023a3:	89 e5                	mov    %esp,%ebp
  1023a5:	83 ec 08             	sub    $0x8,%esp
  1023a8:	e8 02 df ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  1023ad:	05 a3 e5 00 00       	add    $0xe5a3,%eax
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  1023b2:	83 ec 0c             	sub    $0xc,%esp
  1023b5:	ff 75 08             	pushl  0x8(%ebp)
  1023b8:	e8 d8 fd ff ff       	call   102195 <trap_dispatch>
  1023bd:	83 c4 10             	add    $0x10,%esp
    //当发生陷阱中断返回时，要保存旧的cpu状态，并使用iret指令从异常返回程序
    
    
}
  1023c0:	90                   	nop
  1023c1:	c9                   	leave  
  1023c2:	c3                   	ret    

001023c3 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  1023c3:	6a 00                	push   $0x0
  pushl $0
  1023c5:	6a 00                	push   $0x0
  jmp __alltraps
  1023c7:	e9 67 0a 00 00       	jmp    102e33 <__alltraps>

001023cc <vector1>:
.globl vector1
vector1:
  pushl $0
  1023cc:	6a 00                	push   $0x0
  pushl $1
  1023ce:	6a 01                	push   $0x1
  jmp __alltraps
  1023d0:	e9 5e 0a 00 00       	jmp    102e33 <__alltraps>

001023d5 <vector2>:
.globl vector2
vector2:
  pushl $0
  1023d5:	6a 00                	push   $0x0
  pushl $2
  1023d7:	6a 02                	push   $0x2
  jmp __alltraps
  1023d9:	e9 55 0a 00 00       	jmp    102e33 <__alltraps>

001023de <vector3>:
.globl vector3
vector3:
  pushl $0
  1023de:	6a 00                	push   $0x0
  pushl $3
  1023e0:	6a 03                	push   $0x3
  jmp __alltraps
  1023e2:	e9 4c 0a 00 00       	jmp    102e33 <__alltraps>

001023e7 <vector4>:
.globl vector4
vector4:
  pushl $0
  1023e7:	6a 00                	push   $0x0
  pushl $4
  1023e9:	6a 04                	push   $0x4
  jmp __alltraps
  1023eb:	e9 43 0a 00 00       	jmp    102e33 <__alltraps>

001023f0 <vector5>:
.globl vector5
vector5:
  pushl $0
  1023f0:	6a 00                	push   $0x0
  pushl $5
  1023f2:	6a 05                	push   $0x5
  jmp __alltraps
  1023f4:	e9 3a 0a 00 00       	jmp    102e33 <__alltraps>

001023f9 <vector6>:
.globl vector6
vector6:
  pushl $0
  1023f9:	6a 00                	push   $0x0
  pushl $6
  1023fb:	6a 06                	push   $0x6
  jmp __alltraps
  1023fd:	e9 31 0a 00 00       	jmp    102e33 <__alltraps>

00102402 <vector7>:
.globl vector7
vector7:
  pushl $0
  102402:	6a 00                	push   $0x0
  pushl $7
  102404:	6a 07                	push   $0x7
  jmp __alltraps
  102406:	e9 28 0a 00 00       	jmp    102e33 <__alltraps>

0010240b <vector8>:
.globl vector8
vector8:
  pushl $8
  10240b:	6a 08                	push   $0x8
  jmp __alltraps
  10240d:	e9 21 0a 00 00       	jmp    102e33 <__alltraps>

00102412 <vector9>:
.globl vector9
vector9:
  pushl $9
  102412:	6a 09                	push   $0x9
  jmp __alltraps
  102414:	e9 1a 0a 00 00       	jmp    102e33 <__alltraps>

00102419 <vector10>:
.globl vector10
vector10:
  pushl $10
  102419:	6a 0a                	push   $0xa
  jmp __alltraps
  10241b:	e9 13 0a 00 00       	jmp    102e33 <__alltraps>

00102420 <vector11>:
.globl vector11
vector11:
  pushl $11
  102420:	6a 0b                	push   $0xb
  jmp __alltraps
  102422:	e9 0c 0a 00 00       	jmp    102e33 <__alltraps>

00102427 <vector12>:
.globl vector12
vector12:
  pushl $12
  102427:	6a 0c                	push   $0xc
  jmp __alltraps
  102429:	e9 05 0a 00 00       	jmp    102e33 <__alltraps>

0010242e <vector13>:
.globl vector13
vector13:
  pushl $13
  10242e:	6a 0d                	push   $0xd
  jmp __alltraps
  102430:	e9 fe 09 00 00       	jmp    102e33 <__alltraps>

00102435 <vector14>:
.globl vector14
vector14:
  pushl $14
  102435:	6a 0e                	push   $0xe
  jmp __alltraps
  102437:	e9 f7 09 00 00       	jmp    102e33 <__alltraps>

0010243c <vector15>:
.globl vector15
vector15:
  pushl $0
  10243c:	6a 00                	push   $0x0
  pushl $15
  10243e:	6a 0f                	push   $0xf
  jmp __alltraps
  102440:	e9 ee 09 00 00       	jmp    102e33 <__alltraps>

00102445 <vector16>:
.globl vector16
vector16:
  pushl $0
  102445:	6a 00                	push   $0x0
  pushl $16
  102447:	6a 10                	push   $0x10
  jmp __alltraps
  102449:	e9 e5 09 00 00       	jmp    102e33 <__alltraps>

0010244e <vector17>:
.globl vector17
vector17:
  pushl $17
  10244e:	6a 11                	push   $0x11
  jmp __alltraps
  102450:	e9 de 09 00 00       	jmp    102e33 <__alltraps>

00102455 <vector18>:
.globl vector18
vector18:
  pushl $0
  102455:	6a 00                	push   $0x0
  pushl $18
  102457:	6a 12                	push   $0x12
  jmp __alltraps
  102459:	e9 d5 09 00 00       	jmp    102e33 <__alltraps>

0010245e <vector19>:
.globl vector19
vector19:
  pushl $0
  10245e:	6a 00                	push   $0x0
  pushl $19
  102460:	6a 13                	push   $0x13
  jmp __alltraps
  102462:	e9 cc 09 00 00       	jmp    102e33 <__alltraps>

00102467 <vector20>:
.globl vector20
vector20:
  pushl $0
  102467:	6a 00                	push   $0x0
  pushl $20
  102469:	6a 14                	push   $0x14
  jmp __alltraps
  10246b:	e9 c3 09 00 00       	jmp    102e33 <__alltraps>

00102470 <vector21>:
.globl vector21
vector21:
  pushl $0
  102470:	6a 00                	push   $0x0
  pushl $21
  102472:	6a 15                	push   $0x15
  jmp __alltraps
  102474:	e9 ba 09 00 00       	jmp    102e33 <__alltraps>

00102479 <vector22>:
.globl vector22
vector22:
  pushl $0
  102479:	6a 00                	push   $0x0
  pushl $22
  10247b:	6a 16                	push   $0x16
  jmp __alltraps
  10247d:	e9 b1 09 00 00       	jmp    102e33 <__alltraps>

00102482 <vector23>:
.globl vector23
vector23:
  pushl $0
  102482:	6a 00                	push   $0x0
  pushl $23
  102484:	6a 17                	push   $0x17
  jmp __alltraps
  102486:	e9 a8 09 00 00       	jmp    102e33 <__alltraps>

0010248b <vector24>:
.globl vector24
vector24:
  pushl $0
  10248b:	6a 00                	push   $0x0
  pushl $24
  10248d:	6a 18                	push   $0x18
  jmp __alltraps
  10248f:	e9 9f 09 00 00       	jmp    102e33 <__alltraps>

00102494 <vector25>:
.globl vector25
vector25:
  pushl $0
  102494:	6a 00                	push   $0x0
  pushl $25
  102496:	6a 19                	push   $0x19
  jmp __alltraps
  102498:	e9 96 09 00 00       	jmp    102e33 <__alltraps>

0010249d <vector26>:
.globl vector26
vector26:
  pushl $0
  10249d:	6a 00                	push   $0x0
  pushl $26
  10249f:	6a 1a                	push   $0x1a
  jmp __alltraps
  1024a1:	e9 8d 09 00 00       	jmp    102e33 <__alltraps>

001024a6 <vector27>:
.globl vector27
vector27:
  pushl $0
  1024a6:	6a 00                	push   $0x0
  pushl $27
  1024a8:	6a 1b                	push   $0x1b
  jmp __alltraps
  1024aa:	e9 84 09 00 00       	jmp    102e33 <__alltraps>

001024af <vector28>:
.globl vector28
vector28:
  pushl $0
  1024af:	6a 00                	push   $0x0
  pushl $28
  1024b1:	6a 1c                	push   $0x1c
  jmp __alltraps
  1024b3:	e9 7b 09 00 00       	jmp    102e33 <__alltraps>

001024b8 <vector29>:
.globl vector29
vector29:
  pushl $0
  1024b8:	6a 00                	push   $0x0
  pushl $29
  1024ba:	6a 1d                	push   $0x1d
  jmp __alltraps
  1024bc:	e9 72 09 00 00       	jmp    102e33 <__alltraps>

001024c1 <vector30>:
.globl vector30
vector30:
  pushl $0
  1024c1:	6a 00                	push   $0x0
  pushl $30
  1024c3:	6a 1e                	push   $0x1e
  jmp __alltraps
  1024c5:	e9 69 09 00 00       	jmp    102e33 <__alltraps>

001024ca <vector31>:
.globl vector31
vector31:
  pushl $0
  1024ca:	6a 00                	push   $0x0
  pushl $31
  1024cc:	6a 1f                	push   $0x1f
  jmp __alltraps
  1024ce:	e9 60 09 00 00       	jmp    102e33 <__alltraps>

001024d3 <vector32>:
.globl vector32
vector32:
  pushl $0
  1024d3:	6a 00                	push   $0x0
  pushl $32
  1024d5:	6a 20                	push   $0x20
  jmp __alltraps
  1024d7:	e9 57 09 00 00       	jmp    102e33 <__alltraps>

001024dc <vector33>:
.globl vector33
vector33:
  pushl $0
  1024dc:	6a 00                	push   $0x0
  pushl $33
  1024de:	6a 21                	push   $0x21
  jmp __alltraps
  1024e0:	e9 4e 09 00 00       	jmp    102e33 <__alltraps>

001024e5 <vector34>:
.globl vector34
vector34:
  pushl $0
  1024e5:	6a 00                	push   $0x0
  pushl $34
  1024e7:	6a 22                	push   $0x22
  jmp __alltraps
  1024e9:	e9 45 09 00 00       	jmp    102e33 <__alltraps>

001024ee <vector35>:
.globl vector35
vector35:
  pushl $0
  1024ee:	6a 00                	push   $0x0
  pushl $35
  1024f0:	6a 23                	push   $0x23
  jmp __alltraps
  1024f2:	e9 3c 09 00 00       	jmp    102e33 <__alltraps>

001024f7 <vector36>:
.globl vector36
vector36:
  pushl $0
  1024f7:	6a 00                	push   $0x0
  pushl $36
  1024f9:	6a 24                	push   $0x24
  jmp __alltraps
  1024fb:	e9 33 09 00 00       	jmp    102e33 <__alltraps>

00102500 <vector37>:
.globl vector37
vector37:
  pushl $0
  102500:	6a 00                	push   $0x0
  pushl $37
  102502:	6a 25                	push   $0x25
  jmp __alltraps
  102504:	e9 2a 09 00 00       	jmp    102e33 <__alltraps>

00102509 <vector38>:
.globl vector38
vector38:
  pushl $0
  102509:	6a 00                	push   $0x0
  pushl $38
  10250b:	6a 26                	push   $0x26
  jmp __alltraps
  10250d:	e9 21 09 00 00       	jmp    102e33 <__alltraps>

00102512 <vector39>:
.globl vector39
vector39:
  pushl $0
  102512:	6a 00                	push   $0x0
  pushl $39
  102514:	6a 27                	push   $0x27
  jmp __alltraps
  102516:	e9 18 09 00 00       	jmp    102e33 <__alltraps>

0010251b <vector40>:
.globl vector40
vector40:
  pushl $0
  10251b:	6a 00                	push   $0x0
  pushl $40
  10251d:	6a 28                	push   $0x28
  jmp __alltraps
  10251f:	e9 0f 09 00 00       	jmp    102e33 <__alltraps>

00102524 <vector41>:
.globl vector41
vector41:
  pushl $0
  102524:	6a 00                	push   $0x0
  pushl $41
  102526:	6a 29                	push   $0x29
  jmp __alltraps
  102528:	e9 06 09 00 00       	jmp    102e33 <__alltraps>

0010252d <vector42>:
.globl vector42
vector42:
  pushl $0
  10252d:	6a 00                	push   $0x0
  pushl $42
  10252f:	6a 2a                	push   $0x2a
  jmp __alltraps
  102531:	e9 fd 08 00 00       	jmp    102e33 <__alltraps>

00102536 <vector43>:
.globl vector43
vector43:
  pushl $0
  102536:	6a 00                	push   $0x0
  pushl $43
  102538:	6a 2b                	push   $0x2b
  jmp __alltraps
  10253a:	e9 f4 08 00 00       	jmp    102e33 <__alltraps>

0010253f <vector44>:
.globl vector44
vector44:
  pushl $0
  10253f:	6a 00                	push   $0x0
  pushl $44
  102541:	6a 2c                	push   $0x2c
  jmp __alltraps
  102543:	e9 eb 08 00 00       	jmp    102e33 <__alltraps>

00102548 <vector45>:
.globl vector45
vector45:
  pushl $0
  102548:	6a 00                	push   $0x0
  pushl $45
  10254a:	6a 2d                	push   $0x2d
  jmp __alltraps
  10254c:	e9 e2 08 00 00       	jmp    102e33 <__alltraps>

00102551 <vector46>:
.globl vector46
vector46:
  pushl $0
  102551:	6a 00                	push   $0x0
  pushl $46
  102553:	6a 2e                	push   $0x2e
  jmp __alltraps
  102555:	e9 d9 08 00 00       	jmp    102e33 <__alltraps>

0010255a <vector47>:
.globl vector47
vector47:
  pushl $0
  10255a:	6a 00                	push   $0x0
  pushl $47
  10255c:	6a 2f                	push   $0x2f
  jmp __alltraps
  10255e:	e9 d0 08 00 00       	jmp    102e33 <__alltraps>

00102563 <vector48>:
.globl vector48
vector48:
  pushl $0
  102563:	6a 00                	push   $0x0
  pushl $48
  102565:	6a 30                	push   $0x30
  jmp __alltraps
  102567:	e9 c7 08 00 00       	jmp    102e33 <__alltraps>

0010256c <vector49>:
.globl vector49
vector49:
  pushl $0
  10256c:	6a 00                	push   $0x0
  pushl $49
  10256e:	6a 31                	push   $0x31
  jmp __alltraps
  102570:	e9 be 08 00 00       	jmp    102e33 <__alltraps>

00102575 <vector50>:
.globl vector50
vector50:
  pushl $0
  102575:	6a 00                	push   $0x0
  pushl $50
  102577:	6a 32                	push   $0x32
  jmp __alltraps
  102579:	e9 b5 08 00 00       	jmp    102e33 <__alltraps>

0010257e <vector51>:
.globl vector51
vector51:
  pushl $0
  10257e:	6a 00                	push   $0x0
  pushl $51
  102580:	6a 33                	push   $0x33
  jmp __alltraps
  102582:	e9 ac 08 00 00       	jmp    102e33 <__alltraps>

00102587 <vector52>:
.globl vector52
vector52:
  pushl $0
  102587:	6a 00                	push   $0x0
  pushl $52
  102589:	6a 34                	push   $0x34
  jmp __alltraps
  10258b:	e9 a3 08 00 00       	jmp    102e33 <__alltraps>

00102590 <vector53>:
.globl vector53
vector53:
  pushl $0
  102590:	6a 00                	push   $0x0
  pushl $53
  102592:	6a 35                	push   $0x35
  jmp __alltraps
  102594:	e9 9a 08 00 00       	jmp    102e33 <__alltraps>

00102599 <vector54>:
.globl vector54
vector54:
  pushl $0
  102599:	6a 00                	push   $0x0
  pushl $54
  10259b:	6a 36                	push   $0x36
  jmp __alltraps
  10259d:	e9 91 08 00 00       	jmp    102e33 <__alltraps>

001025a2 <vector55>:
.globl vector55
vector55:
  pushl $0
  1025a2:	6a 00                	push   $0x0
  pushl $55
  1025a4:	6a 37                	push   $0x37
  jmp __alltraps
  1025a6:	e9 88 08 00 00       	jmp    102e33 <__alltraps>

001025ab <vector56>:
.globl vector56
vector56:
  pushl $0
  1025ab:	6a 00                	push   $0x0
  pushl $56
  1025ad:	6a 38                	push   $0x38
  jmp __alltraps
  1025af:	e9 7f 08 00 00       	jmp    102e33 <__alltraps>

001025b4 <vector57>:
.globl vector57
vector57:
  pushl $0
  1025b4:	6a 00                	push   $0x0
  pushl $57
  1025b6:	6a 39                	push   $0x39
  jmp __alltraps
  1025b8:	e9 76 08 00 00       	jmp    102e33 <__alltraps>

001025bd <vector58>:
.globl vector58
vector58:
  pushl $0
  1025bd:	6a 00                	push   $0x0
  pushl $58
  1025bf:	6a 3a                	push   $0x3a
  jmp __alltraps
  1025c1:	e9 6d 08 00 00       	jmp    102e33 <__alltraps>

001025c6 <vector59>:
.globl vector59
vector59:
  pushl $0
  1025c6:	6a 00                	push   $0x0
  pushl $59
  1025c8:	6a 3b                	push   $0x3b
  jmp __alltraps
  1025ca:	e9 64 08 00 00       	jmp    102e33 <__alltraps>

001025cf <vector60>:
.globl vector60
vector60:
  pushl $0
  1025cf:	6a 00                	push   $0x0
  pushl $60
  1025d1:	6a 3c                	push   $0x3c
  jmp __alltraps
  1025d3:	e9 5b 08 00 00       	jmp    102e33 <__alltraps>

001025d8 <vector61>:
.globl vector61
vector61:
  pushl $0
  1025d8:	6a 00                	push   $0x0
  pushl $61
  1025da:	6a 3d                	push   $0x3d
  jmp __alltraps
  1025dc:	e9 52 08 00 00       	jmp    102e33 <__alltraps>

001025e1 <vector62>:
.globl vector62
vector62:
  pushl $0
  1025e1:	6a 00                	push   $0x0
  pushl $62
  1025e3:	6a 3e                	push   $0x3e
  jmp __alltraps
  1025e5:	e9 49 08 00 00       	jmp    102e33 <__alltraps>

001025ea <vector63>:
.globl vector63
vector63:
  pushl $0
  1025ea:	6a 00                	push   $0x0
  pushl $63
  1025ec:	6a 3f                	push   $0x3f
  jmp __alltraps
  1025ee:	e9 40 08 00 00       	jmp    102e33 <__alltraps>

001025f3 <vector64>:
.globl vector64
vector64:
  pushl $0
  1025f3:	6a 00                	push   $0x0
  pushl $64
  1025f5:	6a 40                	push   $0x40
  jmp __alltraps
  1025f7:	e9 37 08 00 00       	jmp    102e33 <__alltraps>

001025fc <vector65>:
.globl vector65
vector65:
  pushl $0
  1025fc:	6a 00                	push   $0x0
  pushl $65
  1025fe:	6a 41                	push   $0x41
  jmp __alltraps
  102600:	e9 2e 08 00 00       	jmp    102e33 <__alltraps>

00102605 <vector66>:
.globl vector66
vector66:
  pushl $0
  102605:	6a 00                	push   $0x0
  pushl $66
  102607:	6a 42                	push   $0x42
  jmp __alltraps
  102609:	e9 25 08 00 00       	jmp    102e33 <__alltraps>

0010260e <vector67>:
.globl vector67
vector67:
  pushl $0
  10260e:	6a 00                	push   $0x0
  pushl $67
  102610:	6a 43                	push   $0x43
  jmp __alltraps
  102612:	e9 1c 08 00 00       	jmp    102e33 <__alltraps>

00102617 <vector68>:
.globl vector68
vector68:
  pushl $0
  102617:	6a 00                	push   $0x0
  pushl $68
  102619:	6a 44                	push   $0x44
  jmp __alltraps
  10261b:	e9 13 08 00 00       	jmp    102e33 <__alltraps>

00102620 <vector69>:
.globl vector69
vector69:
  pushl $0
  102620:	6a 00                	push   $0x0
  pushl $69
  102622:	6a 45                	push   $0x45
  jmp __alltraps
  102624:	e9 0a 08 00 00       	jmp    102e33 <__alltraps>

00102629 <vector70>:
.globl vector70
vector70:
  pushl $0
  102629:	6a 00                	push   $0x0
  pushl $70
  10262b:	6a 46                	push   $0x46
  jmp __alltraps
  10262d:	e9 01 08 00 00       	jmp    102e33 <__alltraps>

00102632 <vector71>:
.globl vector71
vector71:
  pushl $0
  102632:	6a 00                	push   $0x0
  pushl $71
  102634:	6a 47                	push   $0x47
  jmp __alltraps
  102636:	e9 f8 07 00 00       	jmp    102e33 <__alltraps>

0010263b <vector72>:
.globl vector72
vector72:
  pushl $0
  10263b:	6a 00                	push   $0x0
  pushl $72
  10263d:	6a 48                	push   $0x48
  jmp __alltraps
  10263f:	e9 ef 07 00 00       	jmp    102e33 <__alltraps>

00102644 <vector73>:
.globl vector73
vector73:
  pushl $0
  102644:	6a 00                	push   $0x0
  pushl $73
  102646:	6a 49                	push   $0x49
  jmp __alltraps
  102648:	e9 e6 07 00 00       	jmp    102e33 <__alltraps>

0010264d <vector74>:
.globl vector74
vector74:
  pushl $0
  10264d:	6a 00                	push   $0x0
  pushl $74
  10264f:	6a 4a                	push   $0x4a
  jmp __alltraps
  102651:	e9 dd 07 00 00       	jmp    102e33 <__alltraps>

00102656 <vector75>:
.globl vector75
vector75:
  pushl $0
  102656:	6a 00                	push   $0x0
  pushl $75
  102658:	6a 4b                	push   $0x4b
  jmp __alltraps
  10265a:	e9 d4 07 00 00       	jmp    102e33 <__alltraps>

0010265f <vector76>:
.globl vector76
vector76:
  pushl $0
  10265f:	6a 00                	push   $0x0
  pushl $76
  102661:	6a 4c                	push   $0x4c
  jmp __alltraps
  102663:	e9 cb 07 00 00       	jmp    102e33 <__alltraps>

00102668 <vector77>:
.globl vector77
vector77:
  pushl $0
  102668:	6a 00                	push   $0x0
  pushl $77
  10266a:	6a 4d                	push   $0x4d
  jmp __alltraps
  10266c:	e9 c2 07 00 00       	jmp    102e33 <__alltraps>

00102671 <vector78>:
.globl vector78
vector78:
  pushl $0
  102671:	6a 00                	push   $0x0
  pushl $78
  102673:	6a 4e                	push   $0x4e
  jmp __alltraps
  102675:	e9 b9 07 00 00       	jmp    102e33 <__alltraps>

0010267a <vector79>:
.globl vector79
vector79:
  pushl $0
  10267a:	6a 00                	push   $0x0
  pushl $79
  10267c:	6a 4f                	push   $0x4f
  jmp __alltraps
  10267e:	e9 b0 07 00 00       	jmp    102e33 <__alltraps>

00102683 <vector80>:
.globl vector80
vector80:
  pushl $0
  102683:	6a 00                	push   $0x0
  pushl $80
  102685:	6a 50                	push   $0x50
  jmp __alltraps
  102687:	e9 a7 07 00 00       	jmp    102e33 <__alltraps>

0010268c <vector81>:
.globl vector81
vector81:
  pushl $0
  10268c:	6a 00                	push   $0x0
  pushl $81
  10268e:	6a 51                	push   $0x51
  jmp __alltraps
  102690:	e9 9e 07 00 00       	jmp    102e33 <__alltraps>

00102695 <vector82>:
.globl vector82
vector82:
  pushl $0
  102695:	6a 00                	push   $0x0
  pushl $82
  102697:	6a 52                	push   $0x52
  jmp __alltraps
  102699:	e9 95 07 00 00       	jmp    102e33 <__alltraps>

0010269e <vector83>:
.globl vector83
vector83:
  pushl $0
  10269e:	6a 00                	push   $0x0
  pushl $83
  1026a0:	6a 53                	push   $0x53
  jmp __alltraps
  1026a2:	e9 8c 07 00 00       	jmp    102e33 <__alltraps>

001026a7 <vector84>:
.globl vector84
vector84:
  pushl $0
  1026a7:	6a 00                	push   $0x0
  pushl $84
  1026a9:	6a 54                	push   $0x54
  jmp __alltraps
  1026ab:	e9 83 07 00 00       	jmp    102e33 <__alltraps>

001026b0 <vector85>:
.globl vector85
vector85:
  pushl $0
  1026b0:	6a 00                	push   $0x0
  pushl $85
  1026b2:	6a 55                	push   $0x55
  jmp __alltraps
  1026b4:	e9 7a 07 00 00       	jmp    102e33 <__alltraps>

001026b9 <vector86>:
.globl vector86
vector86:
  pushl $0
  1026b9:	6a 00                	push   $0x0
  pushl $86
  1026bb:	6a 56                	push   $0x56
  jmp __alltraps
  1026bd:	e9 71 07 00 00       	jmp    102e33 <__alltraps>

001026c2 <vector87>:
.globl vector87
vector87:
  pushl $0
  1026c2:	6a 00                	push   $0x0
  pushl $87
  1026c4:	6a 57                	push   $0x57
  jmp __alltraps
  1026c6:	e9 68 07 00 00       	jmp    102e33 <__alltraps>

001026cb <vector88>:
.globl vector88
vector88:
  pushl $0
  1026cb:	6a 00                	push   $0x0
  pushl $88
  1026cd:	6a 58                	push   $0x58
  jmp __alltraps
  1026cf:	e9 5f 07 00 00       	jmp    102e33 <__alltraps>

001026d4 <vector89>:
.globl vector89
vector89:
  pushl $0
  1026d4:	6a 00                	push   $0x0
  pushl $89
  1026d6:	6a 59                	push   $0x59
  jmp __alltraps
  1026d8:	e9 56 07 00 00       	jmp    102e33 <__alltraps>

001026dd <vector90>:
.globl vector90
vector90:
  pushl $0
  1026dd:	6a 00                	push   $0x0
  pushl $90
  1026df:	6a 5a                	push   $0x5a
  jmp __alltraps
  1026e1:	e9 4d 07 00 00       	jmp    102e33 <__alltraps>

001026e6 <vector91>:
.globl vector91
vector91:
  pushl $0
  1026e6:	6a 00                	push   $0x0
  pushl $91
  1026e8:	6a 5b                	push   $0x5b
  jmp __alltraps
  1026ea:	e9 44 07 00 00       	jmp    102e33 <__alltraps>

001026ef <vector92>:
.globl vector92
vector92:
  pushl $0
  1026ef:	6a 00                	push   $0x0
  pushl $92
  1026f1:	6a 5c                	push   $0x5c
  jmp __alltraps
  1026f3:	e9 3b 07 00 00       	jmp    102e33 <__alltraps>

001026f8 <vector93>:
.globl vector93
vector93:
  pushl $0
  1026f8:	6a 00                	push   $0x0
  pushl $93
  1026fa:	6a 5d                	push   $0x5d
  jmp __alltraps
  1026fc:	e9 32 07 00 00       	jmp    102e33 <__alltraps>

00102701 <vector94>:
.globl vector94
vector94:
  pushl $0
  102701:	6a 00                	push   $0x0
  pushl $94
  102703:	6a 5e                	push   $0x5e
  jmp __alltraps
  102705:	e9 29 07 00 00       	jmp    102e33 <__alltraps>

0010270a <vector95>:
.globl vector95
vector95:
  pushl $0
  10270a:	6a 00                	push   $0x0
  pushl $95
  10270c:	6a 5f                	push   $0x5f
  jmp __alltraps
  10270e:	e9 20 07 00 00       	jmp    102e33 <__alltraps>

00102713 <vector96>:
.globl vector96
vector96:
  pushl $0
  102713:	6a 00                	push   $0x0
  pushl $96
  102715:	6a 60                	push   $0x60
  jmp __alltraps
  102717:	e9 17 07 00 00       	jmp    102e33 <__alltraps>

0010271c <vector97>:
.globl vector97
vector97:
  pushl $0
  10271c:	6a 00                	push   $0x0
  pushl $97
  10271e:	6a 61                	push   $0x61
  jmp __alltraps
  102720:	e9 0e 07 00 00       	jmp    102e33 <__alltraps>

00102725 <vector98>:
.globl vector98
vector98:
  pushl $0
  102725:	6a 00                	push   $0x0
  pushl $98
  102727:	6a 62                	push   $0x62
  jmp __alltraps
  102729:	e9 05 07 00 00       	jmp    102e33 <__alltraps>

0010272e <vector99>:
.globl vector99
vector99:
  pushl $0
  10272e:	6a 00                	push   $0x0
  pushl $99
  102730:	6a 63                	push   $0x63
  jmp __alltraps
  102732:	e9 fc 06 00 00       	jmp    102e33 <__alltraps>

00102737 <vector100>:
.globl vector100
vector100:
  pushl $0
  102737:	6a 00                	push   $0x0
  pushl $100
  102739:	6a 64                	push   $0x64
  jmp __alltraps
  10273b:	e9 f3 06 00 00       	jmp    102e33 <__alltraps>

00102740 <vector101>:
.globl vector101
vector101:
  pushl $0
  102740:	6a 00                	push   $0x0
  pushl $101
  102742:	6a 65                	push   $0x65
  jmp __alltraps
  102744:	e9 ea 06 00 00       	jmp    102e33 <__alltraps>

00102749 <vector102>:
.globl vector102
vector102:
  pushl $0
  102749:	6a 00                	push   $0x0
  pushl $102
  10274b:	6a 66                	push   $0x66
  jmp __alltraps
  10274d:	e9 e1 06 00 00       	jmp    102e33 <__alltraps>

00102752 <vector103>:
.globl vector103
vector103:
  pushl $0
  102752:	6a 00                	push   $0x0
  pushl $103
  102754:	6a 67                	push   $0x67
  jmp __alltraps
  102756:	e9 d8 06 00 00       	jmp    102e33 <__alltraps>

0010275b <vector104>:
.globl vector104
vector104:
  pushl $0
  10275b:	6a 00                	push   $0x0
  pushl $104
  10275d:	6a 68                	push   $0x68
  jmp __alltraps
  10275f:	e9 cf 06 00 00       	jmp    102e33 <__alltraps>

00102764 <vector105>:
.globl vector105
vector105:
  pushl $0
  102764:	6a 00                	push   $0x0
  pushl $105
  102766:	6a 69                	push   $0x69
  jmp __alltraps
  102768:	e9 c6 06 00 00       	jmp    102e33 <__alltraps>

0010276d <vector106>:
.globl vector106
vector106:
  pushl $0
  10276d:	6a 00                	push   $0x0
  pushl $106
  10276f:	6a 6a                	push   $0x6a
  jmp __alltraps
  102771:	e9 bd 06 00 00       	jmp    102e33 <__alltraps>

00102776 <vector107>:
.globl vector107
vector107:
  pushl $0
  102776:	6a 00                	push   $0x0
  pushl $107
  102778:	6a 6b                	push   $0x6b
  jmp __alltraps
  10277a:	e9 b4 06 00 00       	jmp    102e33 <__alltraps>

0010277f <vector108>:
.globl vector108
vector108:
  pushl $0
  10277f:	6a 00                	push   $0x0
  pushl $108
  102781:	6a 6c                	push   $0x6c
  jmp __alltraps
  102783:	e9 ab 06 00 00       	jmp    102e33 <__alltraps>

00102788 <vector109>:
.globl vector109
vector109:
  pushl $0
  102788:	6a 00                	push   $0x0
  pushl $109
  10278a:	6a 6d                	push   $0x6d
  jmp __alltraps
  10278c:	e9 a2 06 00 00       	jmp    102e33 <__alltraps>

00102791 <vector110>:
.globl vector110
vector110:
  pushl $0
  102791:	6a 00                	push   $0x0
  pushl $110
  102793:	6a 6e                	push   $0x6e
  jmp __alltraps
  102795:	e9 99 06 00 00       	jmp    102e33 <__alltraps>

0010279a <vector111>:
.globl vector111
vector111:
  pushl $0
  10279a:	6a 00                	push   $0x0
  pushl $111
  10279c:	6a 6f                	push   $0x6f
  jmp __alltraps
  10279e:	e9 90 06 00 00       	jmp    102e33 <__alltraps>

001027a3 <vector112>:
.globl vector112
vector112:
  pushl $0
  1027a3:	6a 00                	push   $0x0
  pushl $112
  1027a5:	6a 70                	push   $0x70
  jmp __alltraps
  1027a7:	e9 87 06 00 00       	jmp    102e33 <__alltraps>

001027ac <vector113>:
.globl vector113
vector113:
  pushl $0
  1027ac:	6a 00                	push   $0x0
  pushl $113
  1027ae:	6a 71                	push   $0x71
  jmp __alltraps
  1027b0:	e9 7e 06 00 00       	jmp    102e33 <__alltraps>

001027b5 <vector114>:
.globl vector114
vector114:
  pushl $0
  1027b5:	6a 00                	push   $0x0
  pushl $114
  1027b7:	6a 72                	push   $0x72
  jmp __alltraps
  1027b9:	e9 75 06 00 00       	jmp    102e33 <__alltraps>

001027be <vector115>:
.globl vector115
vector115:
  pushl $0
  1027be:	6a 00                	push   $0x0
  pushl $115
  1027c0:	6a 73                	push   $0x73
  jmp __alltraps
  1027c2:	e9 6c 06 00 00       	jmp    102e33 <__alltraps>

001027c7 <vector116>:
.globl vector116
vector116:
  pushl $0
  1027c7:	6a 00                	push   $0x0
  pushl $116
  1027c9:	6a 74                	push   $0x74
  jmp __alltraps
  1027cb:	e9 63 06 00 00       	jmp    102e33 <__alltraps>

001027d0 <vector117>:
.globl vector117
vector117:
  pushl $0
  1027d0:	6a 00                	push   $0x0
  pushl $117
  1027d2:	6a 75                	push   $0x75
  jmp __alltraps
  1027d4:	e9 5a 06 00 00       	jmp    102e33 <__alltraps>

001027d9 <vector118>:
.globl vector118
vector118:
  pushl $0
  1027d9:	6a 00                	push   $0x0
  pushl $118
  1027db:	6a 76                	push   $0x76
  jmp __alltraps
  1027dd:	e9 51 06 00 00       	jmp    102e33 <__alltraps>

001027e2 <vector119>:
.globl vector119
vector119:
  pushl $0
  1027e2:	6a 00                	push   $0x0
  pushl $119
  1027e4:	6a 77                	push   $0x77
  jmp __alltraps
  1027e6:	e9 48 06 00 00       	jmp    102e33 <__alltraps>

001027eb <vector120>:
.globl vector120
vector120:
  pushl $0
  1027eb:	6a 00                	push   $0x0
  pushl $120
  1027ed:	6a 78                	push   $0x78
  jmp __alltraps
  1027ef:	e9 3f 06 00 00       	jmp    102e33 <__alltraps>

001027f4 <vector121>:
.globl vector121
vector121:
  pushl $0
  1027f4:	6a 00                	push   $0x0
  pushl $121
  1027f6:	6a 79                	push   $0x79
  jmp __alltraps
  1027f8:	e9 36 06 00 00       	jmp    102e33 <__alltraps>

001027fd <vector122>:
.globl vector122
vector122:
  pushl $0
  1027fd:	6a 00                	push   $0x0
  pushl $122
  1027ff:	6a 7a                	push   $0x7a
  jmp __alltraps
  102801:	e9 2d 06 00 00       	jmp    102e33 <__alltraps>

00102806 <vector123>:
.globl vector123
vector123:
  pushl $0
  102806:	6a 00                	push   $0x0
  pushl $123
  102808:	6a 7b                	push   $0x7b
  jmp __alltraps
  10280a:	e9 24 06 00 00       	jmp    102e33 <__alltraps>

0010280f <vector124>:
.globl vector124
vector124:
  pushl $0
  10280f:	6a 00                	push   $0x0
  pushl $124
  102811:	6a 7c                	push   $0x7c
  jmp __alltraps
  102813:	e9 1b 06 00 00       	jmp    102e33 <__alltraps>

00102818 <vector125>:
.globl vector125
vector125:
  pushl $0
  102818:	6a 00                	push   $0x0
  pushl $125
  10281a:	6a 7d                	push   $0x7d
  jmp __alltraps
  10281c:	e9 12 06 00 00       	jmp    102e33 <__alltraps>

00102821 <vector126>:
.globl vector126
vector126:
  pushl $0
  102821:	6a 00                	push   $0x0
  pushl $126
  102823:	6a 7e                	push   $0x7e
  jmp __alltraps
  102825:	e9 09 06 00 00       	jmp    102e33 <__alltraps>

0010282a <vector127>:
.globl vector127
vector127:
  pushl $0
  10282a:	6a 00                	push   $0x0
  pushl $127
  10282c:	6a 7f                	push   $0x7f
  jmp __alltraps
  10282e:	e9 00 06 00 00       	jmp    102e33 <__alltraps>

00102833 <vector128>:
.globl vector128
vector128:
  pushl $0
  102833:	6a 00                	push   $0x0
  pushl $128
  102835:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  10283a:	e9 f4 05 00 00       	jmp    102e33 <__alltraps>

0010283f <vector129>:
.globl vector129
vector129:
  pushl $0
  10283f:	6a 00                	push   $0x0
  pushl $129
  102841:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  102846:	e9 e8 05 00 00       	jmp    102e33 <__alltraps>

0010284b <vector130>:
.globl vector130
vector130:
  pushl $0
  10284b:	6a 00                	push   $0x0
  pushl $130
  10284d:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  102852:	e9 dc 05 00 00       	jmp    102e33 <__alltraps>

00102857 <vector131>:
.globl vector131
vector131:
  pushl $0
  102857:	6a 00                	push   $0x0
  pushl $131
  102859:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  10285e:	e9 d0 05 00 00       	jmp    102e33 <__alltraps>

00102863 <vector132>:
.globl vector132
vector132:
  pushl $0
  102863:	6a 00                	push   $0x0
  pushl $132
  102865:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  10286a:	e9 c4 05 00 00       	jmp    102e33 <__alltraps>

0010286f <vector133>:
.globl vector133
vector133:
  pushl $0
  10286f:	6a 00                	push   $0x0
  pushl $133
  102871:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  102876:	e9 b8 05 00 00       	jmp    102e33 <__alltraps>

0010287b <vector134>:
.globl vector134
vector134:
  pushl $0
  10287b:	6a 00                	push   $0x0
  pushl $134
  10287d:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  102882:	e9 ac 05 00 00       	jmp    102e33 <__alltraps>

00102887 <vector135>:
.globl vector135
vector135:
  pushl $0
  102887:	6a 00                	push   $0x0
  pushl $135
  102889:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  10288e:	e9 a0 05 00 00       	jmp    102e33 <__alltraps>

00102893 <vector136>:
.globl vector136
vector136:
  pushl $0
  102893:	6a 00                	push   $0x0
  pushl $136
  102895:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  10289a:	e9 94 05 00 00       	jmp    102e33 <__alltraps>

0010289f <vector137>:
.globl vector137
vector137:
  pushl $0
  10289f:	6a 00                	push   $0x0
  pushl $137
  1028a1:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  1028a6:	e9 88 05 00 00       	jmp    102e33 <__alltraps>

001028ab <vector138>:
.globl vector138
vector138:
  pushl $0
  1028ab:	6a 00                	push   $0x0
  pushl $138
  1028ad:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  1028b2:	e9 7c 05 00 00       	jmp    102e33 <__alltraps>

001028b7 <vector139>:
.globl vector139
vector139:
  pushl $0
  1028b7:	6a 00                	push   $0x0
  pushl $139
  1028b9:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  1028be:	e9 70 05 00 00       	jmp    102e33 <__alltraps>

001028c3 <vector140>:
.globl vector140
vector140:
  pushl $0
  1028c3:	6a 00                	push   $0x0
  pushl $140
  1028c5:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  1028ca:	e9 64 05 00 00       	jmp    102e33 <__alltraps>

001028cf <vector141>:
.globl vector141
vector141:
  pushl $0
  1028cf:	6a 00                	push   $0x0
  pushl $141
  1028d1:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  1028d6:	e9 58 05 00 00       	jmp    102e33 <__alltraps>

001028db <vector142>:
.globl vector142
vector142:
  pushl $0
  1028db:	6a 00                	push   $0x0
  pushl $142
  1028dd:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  1028e2:	e9 4c 05 00 00       	jmp    102e33 <__alltraps>

001028e7 <vector143>:
.globl vector143
vector143:
  pushl $0
  1028e7:	6a 00                	push   $0x0
  pushl $143
  1028e9:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  1028ee:	e9 40 05 00 00       	jmp    102e33 <__alltraps>

001028f3 <vector144>:
.globl vector144
vector144:
  pushl $0
  1028f3:	6a 00                	push   $0x0
  pushl $144
  1028f5:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  1028fa:	e9 34 05 00 00       	jmp    102e33 <__alltraps>

001028ff <vector145>:
.globl vector145
vector145:
  pushl $0
  1028ff:	6a 00                	push   $0x0
  pushl $145
  102901:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  102906:	e9 28 05 00 00       	jmp    102e33 <__alltraps>

0010290b <vector146>:
.globl vector146
vector146:
  pushl $0
  10290b:	6a 00                	push   $0x0
  pushl $146
  10290d:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  102912:	e9 1c 05 00 00       	jmp    102e33 <__alltraps>

00102917 <vector147>:
.globl vector147
vector147:
  pushl $0
  102917:	6a 00                	push   $0x0
  pushl $147
  102919:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  10291e:	e9 10 05 00 00       	jmp    102e33 <__alltraps>

00102923 <vector148>:
.globl vector148
vector148:
  pushl $0
  102923:	6a 00                	push   $0x0
  pushl $148
  102925:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  10292a:	e9 04 05 00 00       	jmp    102e33 <__alltraps>

0010292f <vector149>:
.globl vector149
vector149:
  pushl $0
  10292f:	6a 00                	push   $0x0
  pushl $149
  102931:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  102936:	e9 f8 04 00 00       	jmp    102e33 <__alltraps>

0010293b <vector150>:
.globl vector150
vector150:
  pushl $0
  10293b:	6a 00                	push   $0x0
  pushl $150
  10293d:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  102942:	e9 ec 04 00 00       	jmp    102e33 <__alltraps>

00102947 <vector151>:
.globl vector151
vector151:
  pushl $0
  102947:	6a 00                	push   $0x0
  pushl $151
  102949:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  10294e:	e9 e0 04 00 00       	jmp    102e33 <__alltraps>

00102953 <vector152>:
.globl vector152
vector152:
  pushl $0
  102953:	6a 00                	push   $0x0
  pushl $152
  102955:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  10295a:	e9 d4 04 00 00       	jmp    102e33 <__alltraps>

0010295f <vector153>:
.globl vector153
vector153:
  pushl $0
  10295f:	6a 00                	push   $0x0
  pushl $153
  102961:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  102966:	e9 c8 04 00 00       	jmp    102e33 <__alltraps>

0010296b <vector154>:
.globl vector154
vector154:
  pushl $0
  10296b:	6a 00                	push   $0x0
  pushl $154
  10296d:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  102972:	e9 bc 04 00 00       	jmp    102e33 <__alltraps>

00102977 <vector155>:
.globl vector155
vector155:
  pushl $0
  102977:	6a 00                	push   $0x0
  pushl $155
  102979:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  10297e:	e9 b0 04 00 00       	jmp    102e33 <__alltraps>

00102983 <vector156>:
.globl vector156
vector156:
  pushl $0
  102983:	6a 00                	push   $0x0
  pushl $156
  102985:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  10298a:	e9 a4 04 00 00       	jmp    102e33 <__alltraps>

0010298f <vector157>:
.globl vector157
vector157:
  pushl $0
  10298f:	6a 00                	push   $0x0
  pushl $157
  102991:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  102996:	e9 98 04 00 00       	jmp    102e33 <__alltraps>

0010299b <vector158>:
.globl vector158
vector158:
  pushl $0
  10299b:	6a 00                	push   $0x0
  pushl $158
  10299d:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  1029a2:	e9 8c 04 00 00       	jmp    102e33 <__alltraps>

001029a7 <vector159>:
.globl vector159
vector159:
  pushl $0
  1029a7:	6a 00                	push   $0x0
  pushl $159
  1029a9:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  1029ae:	e9 80 04 00 00       	jmp    102e33 <__alltraps>

001029b3 <vector160>:
.globl vector160
vector160:
  pushl $0
  1029b3:	6a 00                	push   $0x0
  pushl $160
  1029b5:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  1029ba:	e9 74 04 00 00       	jmp    102e33 <__alltraps>

001029bf <vector161>:
.globl vector161
vector161:
  pushl $0
  1029bf:	6a 00                	push   $0x0
  pushl $161
  1029c1:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  1029c6:	e9 68 04 00 00       	jmp    102e33 <__alltraps>

001029cb <vector162>:
.globl vector162
vector162:
  pushl $0
  1029cb:	6a 00                	push   $0x0
  pushl $162
  1029cd:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  1029d2:	e9 5c 04 00 00       	jmp    102e33 <__alltraps>

001029d7 <vector163>:
.globl vector163
vector163:
  pushl $0
  1029d7:	6a 00                	push   $0x0
  pushl $163
  1029d9:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  1029de:	e9 50 04 00 00       	jmp    102e33 <__alltraps>

001029e3 <vector164>:
.globl vector164
vector164:
  pushl $0
  1029e3:	6a 00                	push   $0x0
  pushl $164
  1029e5:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  1029ea:	e9 44 04 00 00       	jmp    102e33 <__alltraps>

001029ef <vector165>:
.globl vector165
vector165:
  pushl $0
  1029ef:	6a 00                	push   $0x0
  pushl $165
  1029f1:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  1029f6:	e9 38 04 00 00       	jmp    102e33 <__alltraps>

001029fb <vector166>:
.globl vector166
vector166:
  pushl $0
  1029fb:	6a 00                	push   $0x0
  pushl $166
  1029fd:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  102a02:	e9 2c 04 00 00       	jmp    102e33 <__alltraps>

00102a07 <vector167>:
.globl vector167
vector167:
  pushl $0
  102a07:	6a 00                	push   $0x0
  pushl $167
  102a09:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  102a0e:	e9 20 04 00 00       	jmp    102e33 <__alltraps>

00102a13 <vector168>:
.globl vector168
vector168:
  pushl $0
  102a13:	6a 00                	push   $0x0
  pushl $168
  102a15:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  102a1a:	e9 14 04 00 00       	jmp    102e33 <__alltraps>

00102a1f <vector169>:
.globl vector169
vector169:
  pushl $0
  102a1f:	6a 00                	push   $0x0
  pushl $169
  102a21:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  102a26:	e9 08 04 00 00       	jmp    102e33 <__alltraps>

00102a2b <vector170>:
.globl vector170
vector170:
  pushl $0
  102a2b:	6a 00                	push   $0x0
  pushl $170
  102a2d:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  102a32:	e9 fc 03 00 00       	jmp    102e33 <__alltraps>

00102a37 <vector171>:
.globl vector171
vector171:
  pushl $0
  102a37:	6a 00                	push   $0x0
  pushl $171
  102a39:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  102a3e:	e9 f0 03 00 00       	jmp    102e33 <__alltraps>

00102a43 <vector172>:
.globl vector172
vector172:
  pushl $0
  102a43:	6a 00                	push   $0x0
  pushl $172
  102a45:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  102a4a:	e9 e4 03 00 00       	jmp    102e33 <__alltraps>

00102a4f <vector173>:
.globl vector173
vector173:
  pushl $0
  102a4f:	6a 00                	push   $0x0
  pushl $173
  102a51:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  102a56:	e9 d8 03 00 00       	jmp    102e33 <__alltraps>

00102a5b <vector174>:
.globl vector174
vector174:
  pushl $0
  102a5b:	6a 00                	push   $0x0
  pushl $174
  102a5d:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  102a62:	e9 cc 03 00 00       	jmp    102e33 <__alltraps>

00102a67 <vector175>:
.globl vector175
vector175:
  pushl $0
  102a67:	6a 00                	push   $0x0
  pushl $175
  102a69:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  102a6e:	e9 c0 03 00 00       	jmp    102e33 <__alltraps>

00102a73 <vector176>:
.globl vector176
vector176:
  pushl $0
  102a73:	6a 00                	push   $0x0
  pushl $176
  102a75:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  102a7a:	e9 b4 03 00 00       	jmp    102e33 <__alltraps>

00102a7f <vector177>:
.globl vector177
vector177:
  pushl $0
  102a7f:	6a 00                	push   $0x0
  pushl $177
  102a81:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  102a86:	e9 a8 03 00 00       	jmp    102e33 <__alltraps>

00102a8b <vector178>:
.globl vector178
vector178:
  pushl $0
  102a8b:	6a 00                	push   $0x0
  pushl $178
  102a8d:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  102a92:	e9 9c 03 00 00       	jmp    102e33 <__alltraps>

00102a97 <vector179>:
.globl vector179
vector179:
  pushl $0
  102a97:	6a 00                	push   $0x0
  pushl $179
  102a99:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  102a9e:	e9 90 03 00 00       	jmp    102e33 <__alltraps>

00102aa3 <vector180>:
.globl vector180
vector180:
  pushl $0
  102aa3:	6a 00                	push   $0x0
  pushl $180
  102aa5:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  102aaa:	e9 84 03 00 00       	jmp    102e33 <__alltraps>

00102aaf <vector181>:
.globl vector181
vector181:
  pushl $0
  102aaf:	6a 00                	push   $0x0
  pushl $181
  102ab1:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  102ab6:	e9 78 03 00 00       	jmp    102e33 <__alltraps>

00102abb <vector182>:
.globl vector182
vector182:
  pushl $0
  102abb:	6a 00                	push   $0x0
  pushl $182
  102abd:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  102ac2:	e9 6c 03 00 00       	jmp    102e33 <__alltraps>

00102ac7 <vector183>:
.globl vector183
vector183:
  pushl $0
  102ac7:	6a 00                	push   $0x0
  pushl $183
  102ac9:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  102ace:	e9 60 03 00 00       	jmp    102e33 <__alltraps>

00102ad3 <vector184>:
.globl vector184
vector184:
  pushl $0
  102ad3:	6a 00                	push   $0x0
  pushl $184
  102ad5:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  102ada:	e9 54 03 00 00       	jmp    102e33 <__alltraps>

00102adf <vector185>:
.globl vector185
vector185:
  pushl $0
  102adf:	6a 00                	push   $0x0
  pushl $185
  102ae1:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  102ae6:	e9 48 03 00 00       	jmp    102e33 <__alltraps>

00102aeb <vector186>:
.globl vector186
vector186:
  pushl $0
  102aeb:	6a 00                	push   $0x0
  pushl $186
  102aed:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  102af2:	e9 3c 03 00 00       	jmp    102e33 <__alltraps>

00102af7 <vector187>:
.globl vector187
vector187:
  pushl $0
  102af7:	6a 00                	push   $0x0
  pushl $187
  102af9:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  102afe:	e9 30 03 00 00       	jmp    102e33 <__alltraps>

00102b03 <vector188>:
.globl vector188
vector188:
  pushl $0
  102b03:	6a 00                	push   $0x0
  pushl $188
  102b05:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  102b0a:	e9 24 03 00 00       	jmp    102e33 <__alltraps>

00102b0f <vector189>:
.globl vector189
vector189:
  pushl $0
  102b0f:	6a 00                	push   $0x0
  pushl $189
  102b11:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  102b16:	e9 18 03 00 00       	jmp    102e33 <__alltraps>

00102b1b <vector190>:
.globl vector190
vector190:
  pushl $0
  102b1b:	6a 00                	push   $0x0
  pushl $190
  102b1d:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  102b22:	e9 0c 03 00 00       	jmp    102e33 <__alltraps>

00102b27 <vector191>:
.globl vector191
vector191:
  pushl $0
  102b27:	6a 00                	push   $0x0
  pushl $191
  102b29:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  102b2e:	e9 00 03 00 00       	jmp    102e33 <__alltraps>

00102b33 <vector192>:
.globl vector192
vector192:
  pushl $0
  102b33:	6a 00                	push   $0x0
  pushl $192
  102b35:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  102b3a:	e9 f4 02 00 00       	jmp    102e33 <__alltraps>

00102b3f <vector193>:
.globl vector193
vector193:
  pushl $0
  102b3f:	6a 00                	push   $0x0
  pushl $193
  102b41:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  102b46:	e9 e8 02 00 00       	jmp    102e33 <__alltraps>

00102b4b <vector194>:
.globl vector194
vector194:
  pushl $0
  102b4b:	6a 00                	push   $0x0
  pushl $194
  102b4d:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  102b52:	e9 dc 02 00 00       	jmp    102e33 <__alltraps>

00102b57 <vector195>:
.globl vector195
vector195:
  pushl $0
  102b57:	6a 00                	push   $0x0
  pushl $195
  102b59:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  102b5e:	e9 d0 02 00 00       	jmp    102e33 <__alltraps>

00102b63 <vector196>:
.globl vector196
vector196:
  pushl $0
  102b63:	6a 00                	push   $0x0
  pushl $196
  102b65:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  102b6a:	e9 c4 02 00 00       	jmp    102e33 <__alltraps>

00102b6f <vector197>:
.globl vector197
vector197:
  pushl $0
  102b6f:	6a 00                	push   $0x0
  pushl $197
  102b71:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  102b76:	e9 b8 02 00 00       	jmp    102e33 <__alltraps>

00102b7b <vector198>:
.globl vector198
vector198:
  pushl $0
  102b7b:	6a 00                	push   $0x0
  pushl $198
  102b7d:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  102b82:	e9 ac 02 00 00       	jmp    102e33 <__alltraps>

00102b87 <vector199>:
.globl vector199
vector199:
  pushl $0
  102b87:	6a 00                	push   $0x0
  pushl $199
  102b89:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  102b8e:	e9 a0 02 00 00       	jmp    102e33 <__alltraps>

00102b93 <vector200>:
.globl vector200
vector200:
  pushl $0
  102b93:	6a 00                	push   $0x0
  pushl $200
  102b95:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  102b9a:	e9 94 02 00 00       	jmp    102e33 <__alltraps>

00102b9f <vector201>:
.globl vector201
vector201:
  pushl $0
  102b9f:	6a 00                	push   $0x0
  pushl $201
  102ba1:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  102ba6:	e9 88 02 00 00       	jmp    102e33 <__alltraps>

00102bab <vector202>:
.globl vector202
vector202:
  pushl $0
  102bab:	6a 00                	push   $0x0
  pushl $202
  102bad:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  102bb2:	e9 7c 02 00 00       	jmp    102e33 <__alltraps>

00102bb7 <vector203>:
.globl vector203
vector203:
  pushl $0
  102bb7:	6a 00                	push   $0x0
  pushl $203
  102bb9:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  102bbe:	e9 70 02 00 00       	jmp    102e33 <__alltraps>

00102bc3 <vector204>:
.globl vector204
vector204:
  pushl $0
  102bc3:	6a 00                	push   $0x0
  pushl $204
  102bc5:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  102bca:	e9 64 02 00 00       	jmp    102e33 <__alltraps>

00102bcf <vector205>:
.globl vector205
vector205:
  pushl $0
  102bcf:	6a 00                	push   $0x0
  pushl $205
  102bd1:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  102bd6:	e9 58 02 00 00       	jmp    102e33 <__alltraps>

00102bdb <vector206>:
.globl vector206
vector206:
  pushl $0
  102bdb:	6a 00                	push   $0x0
  pushl $206
  102bdd:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  102be2:	e9 4c 02 00 00       	jmp    102e33 <__alltraps>

00102be7 <vector207>:
.globl vector207
vector207:
  pushl $0
  102be7:	6a 00                	push   $0x0
  pushl $207
  102be9:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  102bee:	e9 40 02 00 00       	jmp    102e33 <__alltraps>

00102bf3 <vector208>:
.globl vector208
vector208:
  pushl $0
  102bf3:	6a 00                	push   $0x0
  pushl $208
  102bf5:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  102bfa:	e9 34 02 00 00       	jmp    102e33 <__alltraps>

00102bff <vector209>:
.globl vector209
vector209:
  pushl $0
  102bff:	6a 00                	push   $0x0
  pushl $209
  102c01:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  102c06:	e9 28 02 00 00       	jmp    102e33 <__alltraps>

00102c0b <vector210>:
.globl vector210
vector210:
  pushl $0
  102c0b:	6a 00                	push   $0x0
  pushl $210
  102c0d:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  102c12:	e9 1c 02 00 00       	jmp    102e33 <__alltraps>

00102c17 <vector211>:
.globl vector211
vector211:
  pushl $0
  102c17:	6a 00                	push   $0x0
  pushl $211
  102c19:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  102c1e:	e9 10 02 00 00       	jmp    102e33 <__alltraps>

00102c23 <vector212>:
.globl vector212
vector212:
  pushl $0
  102c23:	6a 00                	push   $0x0
  pushl $212
  102c25:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  102c2a:	e9 04 02 00 00       	jmp    102e33 <__alltraps>

00102c2f <vector213>:
.globl vector213
vector213:
  pushl $0
  102c2f:	6a 00                	push   $0x0
  pushl $213
  102c31:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  102c36:	e9 f8 01 00 00       	jmp    102e33 <__alltraps>

00102c3b <vector214>:
.globl vector214
vector214:
  pushl $0
  102c3b:	6a 00                	push   $0x0
  pushl $214
  102c3d:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  102c42:	e9 ec 01 00 00       	jmp    102e33 <__alltraps>

00102c47 <vector215>:
.globl vector215
vector215:
  pushl $0
  102c47:	6a 00                	push   $0x0
  pushl $215
  102c49:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  102c4e:	e9 e0 01 00 00       	jmp    102e33 <__alltraps>

00102c53 <vector216>:
.globl vector216
vector216:
  pushl $0
  102c53:	6a 00                	push   $0x0
  pushl $216
  102c55:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  102c5a:	e9 d4 01 00 00       	jmp    102e33 <__alltraps>

00102c5f <vector217>:
.globl vector217
vector217:
  pushl $0
  102c5f:	6a 00                	push   $0x0
  pushl $217
  102c61:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  102c66:	e9 c8 01 00 00       	jmp    102e33 <__alltraps>

00102c6b <vector218>:
.globl vector218
vector218:
  pushl $0
  102c6b:	6a 00                	push   $0x0
  pushl $218
  102c6d:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  102c72:	e9 bc 01 00 00       	jmp    102e33 <__alltraps>

00102c77 <vector219>:
.globl vector219
vector219:
  pushl $0
  102c77:	6a 00                	push   $0x0
  pushl $219
  102c79:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  102c7e:	e9 b0 01 00 00       	jmp    102e33 <__alltraps>

00102c83 <vector220>:
.globl vector220
vector220:
  pushl $0
  102c83:	6a 00                	push   $0x0
  pushl $220
  102c85:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  102c8a:	e9 a4 01 00 00       	jmp    102e33 <__alltraps>

00102c8f <vector221>:
.globl vector221
vector221:
  pushl $0
  102c8f:	6a 00                	push   $0x0
  pushl $221
  102c91:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  102c96:	e9 98 01 00 00       	jmp    102e33 <__alltraps>

00102c9b <vector222>:
.globl vector222
vector222:
  pushl $0
  102c9b:	6a 00                	push   $0x0
  pushl $222
  102c9d:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  102ca2:	e9 8c 01 00 00       	jmp    102e33 <__alltraps>

00102ca7 <vector223>:
.globl vector223
vector223:
  pushl $0
  102ca7:	6a 00                	push   $0x0
  pushl $223
  102ca9:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  102cae:	e9 80 01 00 00       	jmp    102e33 <__alltraps>

00102cb3 <vector224>:
.globl vector224
vector224:
  pushl $0
  102cb3:	6a 00                	push   $0x0
  pushl $224
  102cb5:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  102cba:	e9 74 01 00 00       	jmp    102e33 <__alltraps>

00102cbf <vector225>:
.globl vector225
vector225:
  pushl $0
  102cbf:	6a 00                	push   $0x0
  pushl $225
  102cc1:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  102cc6:	e9 68 01 00 00       	jmp    102e33 <__alltraps>

00102ccb <vector226>:
.globl vector226
vector226:
  pushl $0
  102ccb:	6a 00                	push   $0x0
  pushl $226
  102ccd:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  102cd2:	e9 5c 01 00 00       	jmp    102e33 <__alltraps>

00102cd7 <vector227>:
.globl vector227
vector227:
  pushl $0
  102cd7:	6a 00                	push   $0x0
  pushl $227
  102cd9:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  102cde:	e9 50 01 00 00       	jmp    102e33 <__alltraps>

00102ce3 <vector228>:
.globl vector228
vector228:
  pushl $0
  102ce3:	6a 00                	push   $0x0
  pushl $228
  102ce5:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  102cea:	e9 44 01 00 00       	jmp    102e33 <__alltraps>

00102cef <vector229>:
.globl vector229
vector229:
  pushl $0
  102cef:	6a 00                	push   $0x0
  pushl $229
  102cf1:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  102cf6:	e9 38 01 00 00       	jmp    102e33 <__alltraps>

00102cfb <vector230>:
.globl vector230
vector230:
  pushl $0
  102cfb:	6a 00                	push   $0x0
  pushl $230
  102cfd:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  102d02:	e9 2c 01 00 00       	jmp    102e33 <__alltraps>

00102d07 <vector231>:
.globl vector231
vector231:
  pushl $0
  102d07:	6a 00                	push   $0x0
  pushl $231
  102d09:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  102d0e:	e9 20 01 00 00       	jmp    102e33 <__alltraps>

00102d13 <vector232>:
.globl vector232
vector232:
  pushl $0
  102d13:	6a 00                	push   $0x0
  pushl $232
  102d15:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  102d1a:	e9 14 01 00 00       	jmp    102e33 <__alltraps>

00102d1f <vector233>:
.globl vector233
vector233:
  pushl $0
  102d1f:	6a 00                	push   $0x0
  pushl $233
  102d21:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  102d26:	e9 08 01 00 00       	jmp    102e33 <__alltraps>

00102d2b <vector234>:
.globl vector234
vector234:
  pushl $0
  102d2b:	6a 00                	push   $0x0
  pushl $234
  102d2d:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  102d32:	e9 fc 00 00 00       	jmp    102e33 <__alltraps>

00102d37 <vector235>:
.globl vector235
vector235:
  pushl $0
  102d37:	6a 00                	push   $0x0
  pushl $235
  102d39:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  102d3e:	e9 f0 00 00 00       	jmp    102e33 <__alltraps>

00102d43 <vector236>:
.globl vector236
vector236:
  pushl $0
  102d43:	6a 00                	push   $0x0
  pushl $236
  102d45:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  102d4a:	e9 e4 00 00 00       	jmp    102e33 <__alltraps>

00102d4f <vector237>:
.globl vector237
vector237:
  pushl $0
  102d4f:	6a 00                	push   $0x0
  pushl $237
  102d51:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  102d56:	e9 d8 00 00 00       	jmp    102e33 <__alltraps>

00102d5b <vector238>:
.globl vector238
vector238:
  pushl $0
  102d5b:	6a 00                	push   $0x0
  pushl $238
  102d5d:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  102d62:	e9 cc 00 00 00       	jmp    102e33 <__alltraps>

00102d67 <vector239>:
.globl vector239
vector239:
  pushl $0
  102d67:	6a 00                	push   $0x0
  pushl $239
  102d69:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  102d6e:	e9 c0 00 00 00       	jmp    102e33 <__alltraps>

00102d73 <vector240>:
.globl vector240
vector240:
  pushl $0
  102d73:	6a 00                	push   $0x0
  pushl $240
  102d75:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  102d7a:	e9 b4 00 00 00       	jmp    102e33 <__alltraps>

00102d7f <vector241>:
.globl vector241
vector241:
  pushl $0
  102d7f:	6a 00                	push   $0x0
  pushl $241
  102d81:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  102d86:	e9 a8 00 00 00       	jmp    102e33 <__alltraps>

00102d8b <vector242>:
.globl vector242
vector242:
  pushl $0
  102d8b:	6a 00                	push   $0x0
  pushl $242
  102d8d:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  102d92:	e9 9c 00 00 00       	jmp    102e33 <__alltraps>

00102d97 <vector243>:
.globl vector243
vector243:
  pushl $0
  102d97:	6a 00                	push   $0x0
  pushl $243
  102d99:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  102d9e:	e9 90 00 00 00       	jmp    102e33 <__alltraps>

00102da3 <vector244>:
.globl vector244
vector244:
  pushl $0
  102da3:	6a 00                	push   $0x0
  pushl $244
  102da5:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  102daa:	e9 84 00 00 00       	jmp    102e33 <__alltraps>

00102daf <vector245>:
.globl vector245
vector245:
  pushl $0
  102daf:	6a 00                	push   $0x0
  pushl $245
  102db1:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  102db6:	e9 78 00 00 00       	jmp    102e33 <__alltraps>

00102dbb <vector246>:
.globl vector246
vector246:
  pushl $0
  102dbb:	6a 00                	push   $0x0
  pushl $246
  102dbd:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  102dc2:	e9 6c 00 00 00       	jmp    102e33 <__alltraps>

00102dc7 <vector247>:
.globl vector247
vector247:
  pushl $0
  102dc7:	6a 00                	push   $0x0
  pushl $247
  102dc9:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  102dce:	e9 60 00 00 00       	jmp    102e33 <__alltraps>

00102dd3 <vector248>:
.globl vector248
vector248:
  pushl $0
  102dd3:	6a 00                	push   $0x0
  pushl $248
  102dd5:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  102dda:	e9 54 00 00 00       	jmp    102e33 <__alltraps>

00102ddf <vector249>:
.globl vector249
vector249:
  pushl $0
  102ddf:	6a 00                	push   $0x0
  pushl $249
  102de1:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  102de6:	e9 48 00 00 00       	jmp    102e33 <__alltraps>

00102deb <vector250>:
.globl vector250
vector250:
  pushl $0
  102deb:	6a 00                	push   $0x0
  pushl $250
  102ded:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  102df2:	e9 3c 00 00 00       	jmp    102e33 <__alltraps>

00102df7 <vector251>:
.globl vector251
vector251:
  pushl $0
  102df7:	6a 00                	push   $0x0
  pushl $251
  102df9:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  102dfe:	e9 30 00 00 00       	jmp    102e33 <__alltraps>

00102e03 <vector252>:
.globl vector252
vector252:
  pushl $0
  102e03:	6a 00                	push   $0x0
  pushl $252
  102e05:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  102e0a:	e9 24 00 00 00       	jmp    102e33 <__alltraps>

00102e0f <vector253>:
.globl vector253
vector253:
  pushl $0
  102e0f:	6a 00                	push   $0x0
  pushl $253
  102e11:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  102e16:	e9 18 00 00 00       	jmp    102e33 <__alltraps>

00102e1b <vector254>:
.globl vector254
vector254:
  pushl $0
  102e1b:	6a 00                	push   $0x0
  pushl $254
  102e1d:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  102e22:	e9 0c 00 00 00       	jmp    102e33 <__alltraps>

00102e27 <vector255>:
.globl vector255
vector255:
  pushl $0
  102e27:	6a 00                	push   $0x0
  pushl $255
  102e29:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  102e2e:	e9 00 00 00 00       	jmp    102e33 <__alltraps>

00102e33 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  102e33:	1e                   	push   %ds
    pushl %es
  102e34:	06                   	push   %es
    pushl %fs
  102e35:	0f a0                	push   %fs
    pushl %gs
  102e37:	0f a8                	push   %gs
    pushal
  102e39:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  102e3a:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  102e3f:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  102e41:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  102e43:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  102e44:	e8 55 f5 ff ff       	call   10239e <trap>

    # pop the pushed stack pointer
    popl %esp
  102e49:	5c                   	pop    %esp

00102e4a <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  102e4a:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  102e4b:	0f a9                	pop    %gs
    popl %fs
  102e4d:	0f a1                	pop    %fs
    popl %es
  102e4f:	07                   	pop    %es
    popl %ds
  102e50:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  102e51:	83 c4 08             	add    $0x8,%esp
    iret
  102e54:	cf                   	iret   

00102e55 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  102e55:	55                   	push   %ebp
  102e56:	89 e5                	mov    %esp,%ebp
  102e58:	e8 52 d4 ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  102e5d:	05 f3 da 00 00       	add    $0xdaf3,%eax
    asm volatile ("lgdt (%0)" :: "r" (pd));
  102e62:	8b 45 08             	mov    0x8(%ebp),%eax
  102e65:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102e68:	b8 23 00 00 00       	mov    $0x23,%eax
  102e6d:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  102e6f:	b8 23 00 00 00       	mov    $0x23,%eax
  102e74:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102e76:	b8 10 00 00 00       	mov    $0x10,%eax
  102e7b:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  102e7d:	b8 10 00 00 00       	mov    $0x10,%eax
  102e82:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  102e84:	b8 10 00 00 00       	mov    $0x10,%eax
  102e89:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102e8b:	ea 92 2e 10 00 08 00 	ljmp   $0x8,$0x102e92
}
  102e92:	90                   	nop
  102e93:	5d                   	pop    %ebp
  102e94:	c3                   	ret    

00102e95 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  102e95:	f3 0f 1e fb          	endbr32 
  102e99:	55                   	push   %ebp
  102e9a:	89 e5                	mov    %esp,%ebp
  102e9c:	83 ec 10             	sub    $0x10,%esp
  102e9f:	e8 0b d4 ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  102ea4:	05 ac da 00 00       	add    $0xdaac,%eax
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  102ea9:	c7 c2 c0 19 11 00    	mov    $0x1119c0,%edx
  102eaf:	81 c2 00 04 00 00    	add    $0x400,%edx
  102eb5:	89 90 f4 0f 00 00    	mov    %edx,0xff4(%eax)
    ts.ts_ss0 = KERNEL_DS;
  102ebb:	66 c7 80 f8 0f 00 00 	movw   $0x10,0xff8(%eax)
  102ec2:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  102ec4:	66 c7 80 f8 ff ff ff 	movw   $0x68,-0x8(%eax)
  102ecb:	68 00 
  102ecd:	8d 90 f0 0f 00 00    	lea    0xff0(%eax),%edx
  102ed3:	66 89 90 fa ff ff ff 	mov    %dx,-0x6(%eax)
  102eda:	8d 90 f0 0f 00 00    	lea    0xff0(%eax),%edx
  102ee0:	c1 ea 10             	shr    $0x10,%edx
  102ee3:	88 90 fc ff ff ff    	mov    %dl,-0x4(%eax)
  102ee9:	0f b6 90 fd ff ff ff 	movzbl -0x3(%eax),%edx
  102ef0:	83 e2 f0             	and    $0xfffffff0,%edx
  102ef3:	83 ca 09             	or     $0x9,%edx
  102ef6:	88 90 fd ff ff ff    	mov    %dl,-0x3(%eax)
  102efc:	0f b6 90 fd ff ff ff 	movzbl -0x3(%eax),%edx
  102f03:	83 ca 10             	or     $0x10,%edx
  102f06:	88 90 fd ff ff ff    	mov    %dl,-0x3(%eax)
  102f0c:	0f b6 90 fd ff ff ff 	movzbl -0x3(%eax),%edx
  102f13:	83 e2 9f             	and    $0xffffff9f,%edx
  102f16:	88 90 fd ff ff ff    	mov    %dl,-0x3(%eax)
  102f1c:	0f b6 90 fd ff ff ff 	movzbl -0x3(%eax),%edx
  102f23:	83 ca 80             	or     $0xffffff80,%edx
  102f26:	88 90 fd ff ff ff    	mov    %dl,-0x3(%eax)
  102f2c:	0f b6 90 fe ff ff ff 	movzbl -0x2(%eax),%edx
  102f33:	83 e2 f0             	and    $0xfffffff0,%edx
  102f36:	88 90 fe ff ff ff    	mov    %dl,-0x2(%eax)
  102f3c:	0f b6 90 fe ff ff ff 	movzbl -0x2(%eax),%edx
  102f43:	83 e2 ef             	and    $0xffffffef,%edx
  102f46:	88 90 fe ff ff ff    	mov    %dl,-0x2(%eax)
  102f4c:	0f b6 90 fe ff ff ff 	movzbl -0x2(%eax),%edx
  102f53:	83 e2 df             	and    $0xffffffdf,%edx
  102f56:	88 90 fe ff ff ff    	mov    %dl,-0x2(%eax)
  102f5c:	0f b6 90 fe ff ff ff 	movzbl -0x2(%eax),%edx
  102f63:	83 ca 40             	or     $0x40,%edx
  102f66:	88 90 fe ff ff ff    	mov    %dl,-0x2(%eax)
  102f6c:	0f b6 90 fe ff ff ff 	movzbl -0x2(%eax),%edx
  102f73:	83 e2 7f             	and    $0x7f,%edx
  102f76:	88 90 fe ff ff ff    	mov    %dl,-0x2(%eax)
  102f7c:	8d 90 f0 0f 00 00    	lea    0xff0(%eax),%edx
  102f82:	c1 ea 18             	shr    $0x18,%edx
  102f85:	88 90 ff ff ff ff    	mov    %dl,-0x1(%eax)
    gdt[SEG_TSS].sd_s = 0;
  102f8b:	0f b6 90 fd ff ff ff 	movzbl -0x3(%eax),%edx
  102f92:	83 e2 ef             	and    $0xffffffef,%edx
  102f95:	88 90 fd ff ff ff    	mov    %dl,-0x3(%eax)

    // reload all segment registers
    lgdt(&gdt_pd);
  102f9b:	8d 80 d0 00 00 00    	lea    0xd0(%eax),%eax
  102fa1:	50                   	push   %eax
  102fa2:	e8 ae fe ff ff       	call   102e55 <lgdt>
  102fa7:	83 c4 04             	add    $0x4,%esp
  102faa:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102fb0:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102fb4:	0f 00 d8             	ltr    %ax
}
  102fb7:	90                   	nop

    // load the TSS
    ltr(GD_TSS);
}
  102fb8:	90                   	nop
  102fb9:	c9                   	leave  
  102fba:	c3                   	ret    

00102fbb <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102fbb:	f3 0f 1e fb          	endbr32 
  102fbf:	55                   	push   %ebp
  102fc0:	89 e5                	mov    %esp,%ebp
  102fc2:	e8 e8 d2 ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  102fc7:	05 89 d9 00 00       	add    $0xd989,%eax
    gdt_init();
  102fcc:	e8 c4 fe ff ff       	call   102e95 <gdt_init>
}
  102fd1:	90                   	nop
  102fd2:	5d                   	pop    %ebp
  102fd3:	c3                   	ret    

00102fd4 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102fd4:	f3 0f 1e fb          	endbr32 
  102fd8:	55                   	push   %ebp
  102fd9:	89 e5                	mov    %esp,%ebp
  102fdb:	83 ec 10             	sub    $0x10,%esp
  102fde:	e8 cc d2 ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  102fe3:	05 6d d9 00 00       	add    $0xd96d,%eax
    size_t cnt = 0;
  102fe8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102fef:	eb 04                	jmp    102ff5 <strlen+0x21>
        cnt ++;
  102ff1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    while (*s ++ != '\0') {
  102ff5:	8b 45 08             	mov    0x8(%ebp),%eax
  102ff8:	8d 50 01             	lea    0x1(%eax),%edx
  102ffb:	89 55 08             	mov    %edx,0x8(%ebp)
  102ffe:	0f b6 00             	movzbl (%eax),%eax
  103001:	84 c0                	test   %al,%al
  103003:	75 ec                	jne    102ff1 <strlen+0x1d>
    }
    return cnt;
  103005:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  103008:	c9                   	leave  
  103009:	c3                   	ret    

0010300a <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  10300a:	f3 0f 1e fb          	endbr32 
  10300e:	55                   	push   %ebp
  10300f:	89 e5                	mov    %esp,%ebp
  103011:	83 ec 10             	sub    $0x10,%esp
  103014:	e8 96 d2 ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  103019:	05 37 d9 00 00       	add    $0xd937,%eax
    size_t cnt = 0;
  10301e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  103025:	eb 04                	jmp    10302b <strnlen+0x21>
        cnt ++;
  103027:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  10302b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10302e:	3b 45 0c             	cmp    0xc(%ebp),%eax
  103031:	73 10                	jae    103043 <strnlen+0x39>
  103033:	8b 45 08             	mov    0x8(%ebp),%eax
  103036:	8d 50 01             	lea    0x1(%eax),%edx
  103039:	89 55 08             	mov    %edx,0x8(%ebp)
  10303c:	0f b6 00             	movzbl (%eax),%eax
  10303f:	84 c0                	test   %al,%al
  103041:	75 e4                	jne    103027 <strnlen+0x1d>
    }
    return cnt;
  103043:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  103046:	c9                   	leave  
  103047:	c3                   	ret    

00103048 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  103048:	f3 0f 1e fb          	endbr32 
  10304c:	55                   	push   %ebp
  10304d:	89 e5                	mov    %esp,%ebp
  10304f:	57                   	push   %edi
  103050:	56                   	push   %esi
  103051:	83 ec 20             	sub    $0x20,%esp
  103054:	e8 56 d2 ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  103059:	05 f7 d8 00 00       	add    $0xd8f7,%eax
  10305e:	8b 45 08             	mov    0x8(%ebp),%eax
  103061:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103064:	8b 45 0c             	mov    0xc(%ebp),%eax
  103067:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  10306a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10306d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103070:	89 d1                	mov    %edx,%ecx
  103072:	89 c2                	mov    %eax,%edx
  103074:	89 ce                	mov    %ecx,%esi
  103076:	89 d7                	mov    %edx,%edi
  103078:	ac                   	lods   %ds:(%esi),%al
  103079:	aa                   	stos   %al,%es:(%edi)
  10307a:	84 c0                	test   %al,%al
  10307c:	75 fa                	jne    103078 <strcpy+0x30>
  10307e:	89 fa                	mov    %edi,%edx
  103080:	89 f1                	mov    %esi,%ecx
  103082:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  103085:	89 55 e8             	mov    %edx,-0x18(%ebp)
  103088:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  10308b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  10308e:	83 c4 20             	add    $0x20,%esp
  103091:	5e                   	pop    %esi
  103092:	5f                   	pop    %edi
  103093:	5d                   	pop    %ebp
  103094:	c3                   	ret    

00103095 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  103095:	f3 0f 1e fb          	endbr32 
  103099:	55                   	push   %ebp
  10309a:	89 e5                	mov    %esp,%ebp
  10309c:	83 ec 10             	sub    $0x10,%esp
  10309f:	e8 0b d2 ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  1030a4:	05 ac d8 00 00       	add    $0xd8ac,%eax
    char *p = dst;
  1030a9:	8b 45 08             	mov    0x8(%ebp),%eax
  1030ac:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  1030af:	eb 21                	jmp    1030d2 <strncpy+0x3d>
        if ((*p = *src) != '\0') {
  1030b1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030b4:	0f b6 10             	movzbl (%eax),%edx
  1030b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1030ba:	88 10                	mov    %dl,(%eax)
  1030bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1030bf:	0f b6 00             	movzbl (%eax),%eax
  1030c2:	84 c0                	test   %al,%al
  1030c4:	74 04                	je     1030ca <strncpy+0x35>
            src ++;
  1030c6:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  1030ca:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1030ce:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    while (len > 0) {
  1030d2:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1030d6:	75 d9                	jne    1030b1 <strncpy+0x1c>
    }
    return dst;
  1030d8:	8b 45 08             	mov    0x8(%ebp),%eax
}
  1030db:	c9                   	leave  
  1030dc:	c3                   	ret    

001030dd <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  1030dd:	f3 0f 1e fb          	endbr32 
  1030e1:	55                   	push   %ebp
  1030e2:	89 e5                	mov    %esp,%ebp
  1030e4:	57                   	push   %edi
  1030e5:	56                   	push   %esi
  1030e6:	83 ec 20             	sub    $0x20,%esp
  1030e9:	e8 c1 d1 ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  1030ee:	05 62 d8 00 00       	add    $0xd862,%eax
  1030f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1030f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1030f9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030fc:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  1030ff:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103102:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103105:	89 d1                	mov    %edx,%ecx
  103107:	89 c2                	mov    %eax,%edx
  103109:	89 ce                	mov    %ecx,%esi
  10310b:	89 d7                	mov    %edx,%edi
  10310d:	ac                   	lods   %ds:(%esi),%al
  10310e:	ae                   	scas   %es:(%edi),%al
  10310f:	75 08                	jne    103119 <strcmp+0x3c>
  103111:	84 c0                	test   %al,%al
  103113:	75 f8                	jne    10310d <strcmp+0x30>
  103115:	31 c0                	xor    %eax,%eax
  103117:	eb 04                	jmp    10311d <strcmp+0x40>
  103119:	19 c0                	sbb    %eax,%eax
  10311b:	0c 01                	or     $0x1,%al
  10311d:	89 fa                	mov    %edi,%edx
  10311f:	89 f1                	mov    %esi,%ecx
  103121:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103124:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  103127:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    return ret;
  10312a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  10312d:	83 c4 20             	add    $0x20,%esp
  103130:	5e                   	pop    %esi
  103131:	5f                   	pop    %edi
  103132:	5d                   	pop    %ebp
  103133:	c3                   	ret    

00103134 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  103134:	f3 0f 1e fb          	endbr32 
  103138:	55                   	push   %ebp
  103139:	89 e5                	mov    %esp,%ebp
  10313b:	e8 6f d1 ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  103140:	05 10 d8 00 00       	add    $0xd810,%eax
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  103145:	eb 0c                	jmp    103153 <strncmp+0x1f>
        n --, s1 ++, s2 ++;
  103147:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  10314b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  10314f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  103153:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103157:	74 1a                	je     103173 <strncmp+0x3f>
  103159:	8b 45 08             	mov    0x8(%ebp),%eax
  10315c:	0f b6 00             	movzbl (%eax),%eax
  10315f:	84 c0                	test   %al,%al
  103161:	74 10                	je     103173 <strncmp+0x3f>
  103163:	8b 45 08             	mov    0x8(%ebp),%eax
  103166:	0f b6 10             	movzbl (%eax),%edx
  103169:	8b 45 0c             	mov    0xc(%ebp),%eax
  10316c:	0f b6 00             	movzbl (%eax),%eax
  10316f:	38 c2                	cmp    %al,%dl
  103171:	74 d4                	je     103147 <strncmp+0x13>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  103173:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103177:	74 18                	je     103191 <strncmp+0x5d>
  103179:	8b 45 08             	mov    0x8(%ebp),%eax
  10317c:	0f b6 00             	movzbl (%eax),%eax
  10317f:	0f b6 d0             	movzbl %al,%edx
  103182:	8b 45 0c             	mov    0xc(%ebp),%eax
  103185:	0f b6 00             	movzbl (%eax),%eax
  103188:	0f b6 c0             	movzbl %al,%eax
  10318b:	29 c2                	sub    %eax,%edx
  10318d:	89 d0                	mov    %edx,%eax
  10318f:	eb 05                	jmp    103196 <strncmp+0x62>
  103191:	b8 00 00 00 00       	mov    $0x0,%eax
}
  103196:	5d                   	pop    %ebp
  103197:	c3                   	ret    

00103198 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  103198:	f3 0f 1e fb          	endbr32 
  10319c:	55                   	push   %ebp
  10319d:	89 e5                	mov    %esp,%ebp
  10319f:	83 ec 04             	sub    $0x4,%esp
  1031a2:	e8 08 d1 ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  1031a7:	05 a9 d7 00 00       	add    $0xd7a9,%eax
  1031ac:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031af:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  1031b2:	eb 14                	jmp    1031c8 <strchr+0x30>
        if (*s == c) {
  1031b4:	8b 45 08             	mov    0x8(%ebp),%eax
  1031b7:	0f b6 00             	movzbl (%eax),%eax
  1031ba:	38 45 fc             	cmp    %al,-0x4(%ebp)
  1031bd:	75 05                	jne    1031c4 <strchr+0x2c>
            return (char *)s;
  1031bf:	8b 45 08             	mov    0x8(%ebp),%eax
  1031c2:	eb 13                	jmp    1031d7 <strchr+0x3f>
        }
        s ++;
  1031c4:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    while (*s != '\0') {
  1031c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1031cb:	0f b6 00             	movzbl (%eax),%eax
  1031ce:	84 c0                	test   %al,%al
  1031d0:	75 e2                	jne    1031b4 <strchr+0x1c>
    }
    return NULL;
  1031d2:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1031d7:	c9                   	leave  
  1031d8:	c3                   	ret    

001031d9 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  1031d9:	f3 0f 1e fb          	endbr32 
  1031dd:	55                   	push   %ebp
  1031de:	89 e5                	mov    %esp,%ebp
  1031e0:	83 ec 04             	sub    $0x4,%esp
  1031e3:	e8 c7 d0 ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  1031e8:	05 68 d7 00 00       	add    $0xd768,%eax
  1031ed:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031f0:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  1031f3:	eb 0f                	jmp    103204 <strfind+0x2b>
        if (*s == c) {
  1031f5:	8b 45 08             	mov    0x8(%ebp),%eax
  1031f8:	0f b6 00             	movzbl (%eax),%eax
  1031fb:	38 45 fc             	cmp    %al,-0x4(%ebp)
  1031fe:	74 10                	je     103210 <strfind+0x37>
            break;
        }
        s ++;
  103200:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    while (*s != '\0') {
  103204:	8b 45 08             	mov    0x8(%ebp),%eax
  103207:	0f b6 00             	movzbl (%eax),%eax
  10320a:	84 c0                	test   %al,%al
  10320c:	75 e7                	jne    1031f5 <strfind+0x1c>
  10320e:	eb 01                	jmp    103211 <strfind+0x38>
            break;
  103210:	90                   	nop
    }
    return (char *)s;
  103211:	8b 45 08             	mov    0x8(%ebp),%eax
}
  103214:	c9                   	leave  
  103215:	c3                   	ret    

00103216 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  103216:	f3 0f 1e fb          	endbr32 
  10321a:	55                   	push   %ebp
  10321b:	89 e5                	mov    %esp,%ebp
  10321d:	83 ec 10             	sub    $0x10,%esp
  103220:	e8 8a d0 ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  103225:	05 2b d7 00 00       	add    $0xd72b,%eax
    int neg = 0;
  10322a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  103231:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  103238:	eb 04                	jmp    10323e <strtol+0x28>
        s ++;
  10323a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    while (*s == ' ' || *s == '\t') {
  10323e:	8b 45 08             	mov    0x8(%ebp),%eax
  103241:	0f b6 00             	movzbl (%eax),%eax
  103244:	3c 20                	cmp    $0x20,%al
  103246:	74 f2                	je     10323a <strtol+0x24>
  103248:	8b 45 08             	mov    0x8(%ebp),%eax
  10324b:	0f b6 00             	movzbl (%eax),%eax
  10324e:	3c 09                	cmp    $0x9,%al
  103250:	74 e8                	je     10323a <strtol+0x24>
    }

    // plus/minus sign
    if (*s == '+') {
  103252:	8b 45 08             	mov    0x8(%ebp),%eax
  103255:	0f b6 00             	movzbl (%eax),%eax
  103258:	3c 2b                	cmp    $0x2b,%al
  10325a:	75 06                	jne    103262 <strtol+0x4c>
        s ++;
  10325c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103260:	eb 15                	jmp    103277 <strtol+0x61>
    }
    else if (*s == '-') {
  103262:	8b 45 08             	mov    0x8(%ebp),%eax
  103265:	0f b6 00             	movzbl (%eax),%eax
  103268:	3c 2d                	cmp    $0x2d,%al
  10326a:	75 0b                	jne    103277 <strtol+0x61>
        s ++, neg = 1;
  10326c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103270:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  103277:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10327b:	74 06                	je     103283 <strtol+0x6d>
  10327d:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  103281:	75 24                	jne    1032a7 <strtol+0x91>
  103283:	8b 45 08             	mov    0x8(%ebp),%eax
  103286:	0f b6 00             	movzbl (%eax),%eax
  103289:	3c 30                	cmp    $0x30,%al
  10328b:	75 1a                	jne    1032a7 <strtol+0x91>
  10328d:	8b 45 08             	mov    0x8(%ebp),%eax
  103290:	83 c0 01             	add    $0x1,%eax
  103293:	0f b6 00             	movzbl (%eax),%eax
  103296:	3c 78                	cmp    $0x78,%al
  103298:	75 0d                	jne    1032a7 <strtol+0x91>
        s += 2, base = 16;
  10329a:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  10329e:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  1032a5:	eb 2a                	jmp    1032d1 <strtol+0xbb>
    }
    else if (base == 0 && s[0] == '0') {
  1032a7:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1032ab:	75 17                	jne    1032c4 <strtol+0xae>
  1032ad:	8b 45 08             	mov    0x8(%ebp),%eax
  1032b0:	0f b6 00             	movzbl (%eax),%eax
  1032b3:	3c 30                	cmp    $0x30,%al
  1032b5:	75 0d                	jne    1032c4 <strtol+0xae>
        s ++, base = 8;
  1032b7:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1032bb:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  1032c2:	eb 0d                	jmp    1032d1 <strtol+0xbb>
    }
    else if (base == 0) {
  1032c4:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1032c8:	75 07                	jne    1032d1 <strtol+0xbb>
        base = 10;
  1032ca:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  1032d1:	8b 45 08             	mov    0x8(%ebp),%eax
  1032d4:	0f b6 00             	movzbl (%eax),%eax
  1032d7:	3c 2f                	cmp    $0x2f,%al
  1032d9:	7e 1b                	jle    1032f6 <strtol+0xe0>
  1032db:	8b 45 08             	mov    0x8(%ebp),%eax
  1032de:	0f b6 00             	movzbl (%eax),%eax
  1032e1:	3c 39                	cmp    $0x39,%al
  1032e3:	7f 11                	jg     1032f6 <strtol+0xe0>
            dig = *s - '0';
  1032e5:	8b 45 08             	mov    0x8(%ebp),%eax
  1032e8:	0f b6 00             	movzbl (%eax),%eax
  1032eb:	0f be c0             	movsbl %al,%eax
  1032ee:	83 e8 30             	sub    $0x30,%eax
  1032f1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1032f4:	eb 48                	jmp    10333e <strtol+0x128>
        }
        else if (*s >= 'a' && *s <= 'z') {
  1032f6:	8b 45 08             	mov    0x8(%ebp),%eax
  1032f9:	0f b6 00             	movzbl (%eax),%eax
  1032fc:	3c 60                	cmp    $0x60,%al
  1032fe:	7e 1b                	jle    10331b <strtol+0x105>
  103300:	8b 45 08             	mov    0x8(%ebp),%eax
  103303:	0f b6 00             	movzbl (%eax),%eax
  103306:	3c 7a                	cmp    $0x7a,%al
  103308:	7f 11                	jg     10331b <strtol+0x105>
            dig = *s - 'a' + 10;
  10330a:	8b 45 08             	mov    0x8(%ebp),%eax
  10330d:	0f b6 00             	movzbl (%eax),%eax
  103310:	0f be c0             	movsbl %al,%eax
  103313:	83 e8 57             	sub    $0x57,%eax
  103316:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103319:	eb 23                	jmp    10333e <strtol+0x128>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  10331b:	8b 45 08             	mov    0x8(%ebp),%eax
  10331e:	0f b6 00             	movzbl (%eax),%eax
  103321:	3c 40                	cmp    $0x40,%al
  103323:	7e 3c                	jle    103361 <strtol+0x14b>
  103325:	8b 45 08             	mov    0x8(%ebp),%eax
  103328:	0f b6 00             	movzbl (%eax),%eax
  10332b:	3c 5a                	cmp    $0x5a,%al
  10332d:	7f 32                	jg     103361 <strtol+0x14b>
            dig = *s - 'A' + 10;
  10332f:	8b 45 08             	mov    0x8(%ebp),%eax
  103332:	0f b6 00             	movzbl (%eax),%eax
  103335:	0f be c0             	movsbl %al,%eax
  103338:	83 e8 37             	sub    $0x37,%eax
  10333b:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  10333e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103341:	3b 45 10             	cmp    0x10(%ebp),%eax
  103344:	7d 1a                	jge    103360 <strtol+0x14a>
            break;
        }
        s ++, val = (val * base) + dig;
  103346:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  10334a:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10334d:	0f af 45 10          	imul   0x10(%ebp),%eax
  103351:	89 c2                	mov    %eax,%edx
  103353:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103356:	01 d0                	add    %edx,%eax
  103358:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (1) {
  10335b:	e9 71 ff ff ff       	jmp    1032d1 <strtol+0xbb>
            break;
  103360:	90                   	nop
        // we don't properly detect overflow!
    }

    if (endptr) {
  103361:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103365:	74 08                	je     10336f <strtol+0x159>
        *endptr = (char *) s;
  103367:	8b 45 0c             	mov    0xc(%ebp),%eax
  10336a:	8b 55 08             	mov    0x8(%ebp),%edx
  10336d:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  10336f:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  103373:	74 07                	je     10337c <strtol+0x166>
  103375:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103378:	f7 d8                	neg    %eax
  10337a:	eb 03                	jmp    10337f <strtol+0x169>
  10337c:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  10337f:	c9                   	leave  
  103380:	c3                   	ret    

00103381 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  103381:	f3 0f 1e fb          	endbr32 
  103385:	55                   	push   %ebp
  103386:	89 e5                	mov    %esp,%ebp
  103388:	57                   	push   %edi
  103389:	83 ec 24             	sub    $0x24,%esp
  10338c:	e8 1e cf ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  103391:	05 bf d5 00 00       	add    $0xd5bf,%eax
  103396:	8b 45 0c             	mov    0xc(%ebp),%eax
  103399:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  10339c:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  1033a0:	8b 55 08             	mov    0x8(%ebp),%edx
  1033a3:	89 55 f8             	mov    %edx,-0x8(%ebp)
  1033a6:	88 45 f7             	mov    %al,-0x9(%ebp)
  1033a9:	8b 45 10             	mov    0x10(%ebp),%eax
  1033ac:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  1033af:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  1033b2:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  1033b6:	8b 55 f8             	mov    -0x8(%ebp),%edx
  1033b9:	89 d7                	mov    %edx,%edi
  1033bb:	f3 aa                	rep stos %al,%es:(%edi)
  1033bd:	89 fa                	mov    %edi,%edx
  1033bf:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  1033c2:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  1033c5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  1033c8:	83 c4 24             	add    $0x24,%esp
  1033cb:	5f                   	pop    %edi
  1033cc:	5d                   	pop    %ebp
  1033cd:	c3                   	ret    

001033ce <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  1033ce:	f3 0f 1e fb          	endbr32 
  1033d2:	55                   	push   %ebp
  1033d3:	89 e5                	mov    %esp,%ebp
  1033d5:	57                   	push   %edi
  1033d6:	56                   	push   %esi
  1033d7:	53                   	push   %ebx
  1033d8:	83 ec 30             	sub    $0x30,%esp
  1033db:	e8 cf ce ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  1033e0:	05 70 d5 00 00       	add    $0xd570,%eax
  1033e5:	8b 45 08             	mov    0x8(%ebp),%eax
  1033e8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1033ee:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1033f1:	8b 45 10             	mov    0x10(%ebp),%eax
  1033f4:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  1033f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033fa:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  1033fd:	73 42                	jae    103441 <memmove+0x73>
  1033ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103402:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  103405:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103408:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10340b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10340e:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  103411:	8b 45 dc             	mov    -0x24(%ebp),%eax
  103414:	c1 e8 02             	shr    $0x2,%eax
  103417:	89 c1                	mov    %eax,%ecx
    asm volatile (
  103419:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10341c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10341f:	89 d7                	mov    %edx,%edi
  103421:	89 c6                	mov    %eax,%esi
  103423:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  103425:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  103428:	83 e1 03             	and    $0x3,%ecx
  10342b:	74 02                	je     10342f <memmove+0x61>
  10342d:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  10342f:	89 f0                	mov    %esi,%eax
  103431:	89 fa                	mov    %edi,%edx
  103433:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  103436:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  103439:	89 45 d0             	mov    %eax,-0x30(%ebp)
            : "memory");
    return dst;
  10343c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
        return __memcpy(dst, src, n);
  10343f:	eb 36                	jmp    103477 <memmove+0xa9>
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  103441:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103444:	8d 50 ff             	lea    -0x1(%eax),%edx
  103447:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10344a:	01 c2                	add    %eax,%edx
  10344c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10344f:	8d 48 ff             	lea    -0x1(%eax),%ecx
  103452:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103455:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile (
  103458:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10345b:	89 c1                	mov    %eax,%ecx
  10345d:	89 d8                	mov    %ebx,%eax
  10345f:	89 d6                	mov    %edx,%esi
  103461:	89 c7                	mov    %eax,%edi
  103463:	fd                   	std    
  103464:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103466:	fc                   	cld    
  103467:	89 f8                	mov    %edi,%eax
  103469:	89 f2                	mov    %esi,%edx
  10346b:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  10346e:	89 55 c8             	mov    %edx,-0x38(%ebp)
  103471:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    return dst;
  103474:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  103477:	83 c4 30             	add    $0x30,%esp
  10347a:	5b                   	pop    %ebx
  10347b:	5e                   	pop    %esi
  10347c:	5f                   	pop    %edi
  10347d:	5d                   	pop    %ebp
  10347e:	c3                   	ret    

0010347f <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  10347f:	f3 0f 1e fb          	endbr32 
  103483:	55                   	push   %ebp
  103484:	89 e5                	mov    %esp,%ebp
  103486:	57                   	push   %edi
  103487:	56                   	push   %esi
  103488:	83 ec 20             	sub    $0x20,%esp
  10348b:	e8 1f ce ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  103490:	05 c0 d4 00 00       	add    $0xd4c0,%eax
  103495:	8b 45 08             	mov    0x8(%ebp),%eax
  103498:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10349b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10349e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1034a1:	8b 45 10             	mov    0x10(%ebp),%eax
  1034a4:	89 45 ec             	mov    %eax,-0x14(%ebp)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  1034a7:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1034aa:	c1 e8 02             	shr    $0x2,%eax
  1034ad:	89 c1                	mov    %eax,%ecx
    asm volatile (
  1034af:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1034b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1034b5:	89 d7                	mov    %edx,%edi
  1034b7:	89 c6                	mov    %eax,%esi
  1034b9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1034bb:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  1034be:	83 e1 03             	and    $0x3,%ecx
  1034c1:	74 02                	je     1034c5 <memcpy+0x46>
  1034c3:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1034c5:	89 f0                	mov    %esi,%eax
  1034c7:	89 fa                	mov    %edi,%edx
  1034c9:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  1034cc:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  1034cf:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return dst;
  1034d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  1034d5:	83 c4 20             	add    $0x20,%esp
  1034d8:	5e                   	pop    %esi
  1034d9:	5f                   	pop    %edi
  1034da:	5d                   	pop    %ebp
  1034db:	c3                   	ret    

001034dc <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  1034dc:	f3 0f 1e fb          	endbr32 
  1034e0:	55                   	push   %ebp
  1034e1:	89 e5                	mov    %esp,%ebp
  1034e3:	83 ec 10             	sub    $0x10,%esp
  1034e6:	e8 c4 cd ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  1034eb:	05 65 d4 00 00       	add    $0xd465,%eax
    const char *s1 = (const char *)v1;
  1034f0:	8b 45 08             	mov    0x8(%ebp),%eax
  1034f3:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  1034f6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034f9:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  1034fc:	eb 30                	jmp    10352e <memcmp+0x52>
        if (*s1 != *s2) {
  1034fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103501:	0f b6 10             	movzbl (%eax),%edx
  103504:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103507:	0f b6 00             	movzbl (%eax),%eax
  10350a:	38 c2                	cmp    %al,%dl
  10350c:	74 18                	je     103526 <memcmp+0x4a>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  10350e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103511:	0f b6 00             	movzbl (%eax),%eax
  103514:	0f b6 d0             	movzbl %al,%edx
  103517:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10351a:	0f b6 00             	movzbl (%eax),%eax
  10351d:	0f b6 c0             	movzbl %al,%eax
  103520:	29 c2                	sub    %eax,%edx
  103522:	89 d0                	mov    %edx,%eax
  103524:	eb 1a                	jmp    103540 <memcmp+0x64>
        }
        s1 ++, s2 ++;
  103526:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  10352a:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    while (n -- > 0) {
  10352e:	8b 45 10             	mov    0x10(%ebp),%eax
  103531:	8d 50 ff             	lea    -0x1(%eax),%edx
  103534:	89 55 10             	mov    %edx,0x10(%ebp)
  103537:	85 c0                	test   %eax,%eax
  103539:	75 c3                	jne    1034fe <memcmp+0x22>
    }
    return 0;
  10353b:	b8 00 00 00 00       	mov    $0x0,%eax
}
  103540:	c9                   	leave  
  103541:	c3                   	ret    

00103542 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  103542:	f3 0f 1e fb          	endbr32 
  103546:	55                   	push   %ebp
  103547:	89 e5                	mov    %esp,%ebp
  103549:	53                   	push   %ebx
  10354a:	83 ec 34             	sub    $0x34,%esp
  10354d:	e8 61 cd ff ff       	call   1002b3 <__x86.get_pc_thunk.bx>
  103552:	81 c3 fe d3 00 00    	add    $0xd3fe,%ebx
  103558:	8b 45 10             	mov    0x10(%ebp),%eax
  10355b:	89 45 d0             	mov    %eax,-0x30(%ebp)
  10355e:	8b 45 14             	mov    0x14(%ebp),%eax
  103561:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  103564:	8b 45 d0             	mov    -0x30(%ebp),%eax
  103567:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10356a:	89 45 e8             	mov    %eax,-0x18(%ebp)
  10356d:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  103570:	8b 45 18             	mov    0x18(%ebp),%eax
  103573:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  103576:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103579:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10357c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10357f:	89 55 f0             	mov    %edx,-0x10(%ebp)
  103582:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103585:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103588:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10358c:	74 1c                	je     1035aa <printnum+0x68>
  10358e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103591:	ba 00 00 00 00       	mov    $0x0,%edx
  103596:	f7 75 e4             	divl   -0x1c(%ebp)
  103599:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10359c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10359f:	ba 00 00 00 00       	mov    $0x0,%edx
  1035a4:	f7 75 e4             	divl   -0x1c(%ebp)
  1035a7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1035aa:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1035ad:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1035b0:	f7 75 e4             	divl   -0x1c(%ebp)
  1035b3:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1035b6:	89 55 dc             	mov    %edx,-0x24(%ebp)
  1035b9:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1035bc:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1035bf:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1035c2:	89 55 ec             	mov    %edx,-0x14(%ebp)
  1035c5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1035c8:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  1035cb:	8b 45 18             	mov    0x18(%ebp),%eax
  1035ce:	ba 00 00 00 00       	mov    $0x0,%edx
  1035d3:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
  1035d6:	39 45 d0             	cmp    %eax,-0x30(%ebp)
  1035d9:	19 d1                	sbb    %edx,%ecx
  1035db:	72 37                	jb     103614 <printnum+0xd2>
        printnum(putch, putdat, result, base, width - 1, padc);
  1035dd:	8b 45 1c             	mov    0x1c(%ebp),%eax
  1035e0:	83 e8 01             	sub    $0x1,%eax
  1035e3:	83 ec 04             	sub    $0x4,%esp
  1035e6:	ff 75 20             	pushl  0x20(%ebp)
  1035e9:	50                   	push   %eax
  1035ea:	ff 75 18             	pushl  0x18(%ebp)
  1035ed:	ff 75 ec             	pushl  -0x14(%ebp)
  1035f0:	ff 75 e8             	pushl  -0x18(%ebp)
  1035f3:	ff 75 0c             	pushl  0xc(%ebp)
  1035f6:	ff 75 08             	pushl  0x8(%ebp)
  1035f9:	e8 44 ff ff ff       	call   103542 <printnum>
  1035fe:	83 c4 20             	add    $0x20,%esp
  103601:	eb 1b                	jmp    10361e <printnum+0xdc>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  103603:	83 ec 08             	sub    $0x8,%esp
  103606:	ff 75 0c             	pushl  0xc(%ebp)
  103609:	ff 75 20             	pushl  0x20(%ebp)
  10360c:	8b 45 08             	mov    0x8(%ebp),%eax
  10360f:	ff d0                	call   *%eax
  103611:	83 c4 10             	add    $0x10,%esp
        while (-- width > 0)
  103614:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  103618:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  10361c:	7f e5                	jg     103603 <printnum+0xc1>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  10361e:	8d 93 6e 39 ff ff    	lea    -0xc692(%ebx),%edx
  103624:	8b 45 d8             	mov    -0x28(%ebp),%eax
  103627:	01 d0                	add    %edx,%eax
  103629:	0f b6 00             	movzbl (%eax),%eax
  10362c:	0f be c0             	movsbl %al,%eax
  10362f:	83 ec 08             	sub    $0x8,%esp
  103632:	ff 75 0c             	pushl  0xc(%ebp)
  103635:	50                   	push   %eax
  103636:	8b 45 08             	mov    0x8(%ebp),%eax
  103639:	ff d0                	call   *%eax
  10363b:	83 c4 10             	add    $0x10,%esp
}
  10363e:	90                   	nop
  10363f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  103642:	c9                   	leave  
  103643:	c3                   	ret    

00103644 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  103644:	f3 0f 1e fb          	endbr32 
  103648:	55                   	push   %ebp
  103649:	89 e5                	mov    %esp,%ebp
  10364b:	e8 5f cc ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  103650:	05 00 d3 00 00       	add    $0xd300,%eax
    if (lflag >= 2) {
  103655:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  103659:	7e 14                	jle    10366f <getuint+0x2b>
        return va_arg(*ap, unsigned long long);
  10365b:	8b 45 08             	mov    0x8(%ebp),%eax
  10365e:	8b 00                	mov    (%eax),%eax
  103660:	8d 48 08             	lea    0x8(%eax),%ecx
  103663:	8b 55 08             	mov    0x8(%ebp),%edx
  103666:	89 0a                	mov    %ecx,(%edx)
  103668:	8b 50 04             	mov    0x4(%eax),%edx
  10366b:	8b 00                	mov    (%eax),%eax
  10366d:	eb 30                	jmp    10369f <getuint+0x5b>
    }
    else if (lflag) {
  10366f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103673:	74 16                	je     10368b <getuint+0x47>
        return va_arg(*ap, unsigned long);
  103675:	8b 45 08             	mov    0x8(%ebp),%eax
  103678:	8b 00                	mov    (%eax),%eax
  10367a:	8d 48 04             	lea    0x4(%eax),%ecx
  10367d:	8b 55 08             	mov    0x8(%ebp),%edx
  103680:	89 0a                	mov    %ecx,(%edx)
  103682:	8b 00                	mov    (%eax),%eax
  103684:	ba 00 00 00 00       	mov    $0x0,%edx
  103689:	eb 14                	jmp    10369f <getuint+0x5b>
    }
    else {
        return va_arg(*ap, unsigned int);
  10368b:	8b 45 08             	mov    0x8(%ebp),%eax
  10368e:	8b 00                	mov    (%eax),%eax
  103690:	8d 48 04             	lea    0x4(%eax),%ecx
  103693:	8b 55 08             	mov    0x8(%ebp),%edx
  103696:	89 0a                	mov    %ecx,(%edx)
  103698:	8b 00                	mov    (%eax),%eax
  10369a:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  10369f:	5d                   	pop    %ebp
  1036a0:	c3                   	ret    

001036a1 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  1036a1:	f3 0f 1e fb          	endbr32 
  1036a5:	55                   	push   %ebp
  1036a6:	89 e5                	mov    %esp,%ebp
  1036a8:	e8 02 cc ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  1036ad:	05 a3 d2 00 00       	add    $0xd2a3,%eax
    if (lflag >= 2) {
  1036b2:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  1036b6:	7e 14                	jle    1036cc <getint+0x2b>
        return va_arg(*ap, long long);
  1036b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1036bb:	8b 00                	mov    (%eax),%eax
  1036bd:	8d 48 08             	lea    0x8(%eax),%ecx
  1036c0:	8b 55 08             	mov    0x8(%ebp),%edx
  1036c3:	89 0a                	mov    %ecx,(%edx)
  1036c5:	8b 50 04             	mov    0x4(%eax),%edx
  1036c8:	8b 00                	mov    (%eax),%eax
  1036ca:	eb 28                	jmp    1036f4 <getint+0x53>
    }
    else if (lflag) {
  1036cc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1036d0:	74 12                	je     1036e4 <getint+0x43>
        return va_arg(*ap, long);
  1036d2:	8b 45 08             	mov    0x8(%ebp),%eax
  1036d5:	8b 00                	mov    (%eax),%eax
  1036d7:	8d 48 04             	lea    0x4(%eax),%ecx
  1036da:	8b 55 08             	mov    0x8(%ebp),%edx
  1036dd:	89 0a                	mov    %ecx,(%edx)
  1036df:	8b 00                	mov    (%eax),%eax
  1036e1:	99                   	cltd   
  1036e2:	eb 10                	jmp    1036f4 <getint+0x53>
    }
    else {
        return va_arg(*ap, int);
  1036e4:	8b 45 08             	mov    0x8(%ebp),%eax
  1036e7:	8b 00                	mov    (%eax),%eax
  1036e9:	8d 48 04             	lea    0x4(%eax),%ecx
  1036ec:	8b 55 08             	mov    0x8(%ebp),%edx
  1036ef:	89 0a                	mov    %ecx,(%edx)
  1036f1:	8b 00                	mov    (%eax),%eax
  1036f3:	99                   	cltd   
    }
}
  1036f4:	5d                   	pop    %ebp
  1036f5:	c3                   	ret    

001036f6 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  1036f6:	f3 0f 1e fb          	endbr32 
  1036fa:	55                   	push   %ebp
  1036fb:	89 e5                	mov    %esp,%ebp
  1036fd:	83 ec 18             	sub    $0x18,%esp
  103700:	e8 aa cb ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  103705:	05 4b d2 00 00       	add    $0xd24b,%eax
    va_list ap;

    va_start(ap, fmt);
  10370a:	8d 45 14             	lea    0x14(%ebp),%eax
  10370d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  103710:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103713:	50                   	push   %eax
  103714:	ff 75 10             	pushl  0x10(%ebp)
  103717:	ff 75 0c             	pushl  0xc(%ebp)
  10371a:	ff 75 08             	pushl  0x8(%ebp)
  10371d:	e8 06 00 00 00       	call   103728 <vprintfmt>
  103722:	83 c4 10             	add    $0x10,%esp
    va_end(ap);
}
  103725:	90                   	nop
  103726:	c9                   	leave  
  103727:	c3                   	ret    

00103728 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  103728:	f3 0f 1e fb          	endbr32 
  10372c:	55                   	push   %ebp
  10372d:	89 e5                	mov    %esp,%ebp
  10372f:	57                   	push   %edi
  103730:	56                   	push   %esi
  103731:	53                   	push   %ebx
  103732:	83 ec 2c             	sub    $0x2c,%esp
  103735:	e8 99 04 00 00       	call   103bd3 <__x86.get_pc_thunk.di>
  10373a:	81 c7 16 d2 00 00    	add    $0xd216,%edi
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  103740:	eb 17                	jmp    103759 <vprintfmt+0x31>
            if (ch == '\0') {
  103742:	85 db                	test   %ebx,%ebx
  103744:	0f 84 9b 03 00 00    	je     103ae5 <.L22+0x2d>
                return;
            }
            putch(ch, putdat);
  10374a:	83 ec 08             	sub    $0x8,%esp
  10374d:	ff 75 0c             	pushl  0xc(%ebp)
  103750:	53                   	push   %ebx
  103751:	8b 45 08             	mov    0x8(%ebp),%eax
  103754:	ff d0                	call   *%eax
  103756:	83 c4 10             	add    $0x10,%esp
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  103759:	8b 45 10             	mov    0x10(%ebp),%eax
  10375c:	8d 50 01             	lea    0x1(%eax),%edx
  10375f:	89 55 10             	mov    %edx,0x10(%ebp)
  103762:	0f b6 00             	movzbl (%eax),%eax
  103765:	0f b6 d8             	movzbl %al,%ebx
  103768:	83 fb 25             	cmp    $0x25,%ebx
  10376b:	75 d5                	jne    103742 <vprintfmt+0x1a>
        }

        // Process a %-escape sequence
        char padc = ' ';
  10376d:	c6 45 cb 20          	movb   $0x20,-0x35(%ebp)
        width = precision = -1;
  103771:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
  103778:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10377b:	89 45 d8             	mov    %eax,-0x28(%ebp)
        lflag = altflag = 0;
  10377e:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
  103785:	8b 45 cc             	mov    -0x34(%ebp),%eax
  103788:	89 45 d0             	mov    %eax,-0x30(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  10378b:	8b 45 10             	mov    0x10(%ebp),%eax
  10378e:	8d 50 01             	lea    0x1(%eax),%edx
  103791:	89 55 10             	mov    %edx,0x10(%ebp)
  103794:	0f b6 00             	movzbl (%eax),%eax
  103797:	0f b6 d8             	movzbl %al,%ebx
  10379a:	8d 43 dd             	lea    -0x23(%ebx),%eax
  10379d:	83 f8 55             	cmp    $0x55,%eax
  1037a0:	0f 87 12 03 00 00    	ja     103ab8 <.L22>
  1037a6:	c1 e0 02             	shl    $0x2,%eax
  1037a9:	8b 84 38 94 39 ff ff 	mov    -0xc66c(%eax,%edi,1),%eax
  1037b0:	01 f8                	add    %edi,%eax
  1037b2:	3e ff e0             	notrack jmp *%eax

001037b5 <.L36>:

        // flag to pad on the right
        case '-':
            padc = '-';
  1037b5:	c6 45 cb 2d          	movb   $0x2d,-0x35(%ebp)
            goto reswitch;
  1037b9:	eb d0                	jmp    10378b <vprintfmt+0x63>

001037bb <.L34>:

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  1037bb:	c6 45 cb 30          	movb   $0x30,-0x35(%ebp)
            goto reswitch;
  1037bf:	eb ca                	jmp    10378b <vprintfmt+0x63>

001037c1 <.L33>:

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  1037c1:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
                precision = precision * 10 + ch - '0';
  1037c8:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1037cb:	89 d0                	mov    %edx,%eax
  1037cd:	c1 e0 02             	shl    $0x2,%eax
  1037d0:	01 d0                	add    %edx,%eax
  1037d2:	01 c0                	add    %eax,%eax
  1037d4:	01 d8                	add    %ebx,%eax
  1037d6:	83 e8 30             	sub    $0x30,%eax
  1037d9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
                ch = *fmt;
  1037dc:	8b 45 10             	mov    0x10(%ebp),%eax
  1037df:	0f b6 00             	movzbl (%eax),%eax
  1037e2:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  1037e5:	83 fb 2f             	cmp    $0x2f,%ebx
  1037e8:	7e 39                	jle    103823 <.L39+0xc>
  1037ea:	83 fb 39             	cmp    $0x39,%ebx
  1037ed:	7f 34                	jg     103823 <.L39+0xc>
            for (precision = 0; ; ++ fmt) {
  1037ef:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                precision = precision * 10 + ch - '0';
  1037f3:	eb d3                	jmp    1037c8 <.L33+0x7>

001037f5 <.L37>:
                }
            }
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  1037f5:	8b 45 14             	mov    0x14(%ebp),%eax
  1037f8:	8d 50 04             	lea    0x4(%eax),%edx
  1037fb:	89 55 14             	mov    %edx,0x14(%ebp)
  1037fe:	8b 00                	mov    (%eax),%eax
  103800:	89 45 d4             	mov    %eax,-0x2c(%ebp)
            goto process_precision;
  103803:	eb 1f                	jmp    103824 <.L39+0xd>

00103805 <.L35>:

        case '.':
            if (width < 0)
  103805:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  103809:	79 80                	jns    10378b <vprintfmt+0x63>
                width = 0;
  10380b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
            goto reswitch;
  103812:	e9 74 ff ff ff       	jmp    10378b <vprintfmt+0x63>

00103817 <.L39>:

        case '#':
            altflag = 1;
  103817:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
            goto reswitch;
  10381e:	e9 68 ff ff ff       	jmp    10378b <vprintfmt+0x63>
            goto process_precision;
  103823:	90                   	nop

        process_precision:
            if (width < 0)
  103824:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  103828:	0f 89 5d ff ff ff    	jns    10378b <vprintfmt+0x63>
                width = precision, precision = -1;
  10382e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  103831:	89 45 d8             	mov    %eax,-0x28(%ebp)
  103834:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
            goto reswitch;
  10383b:	e9 4b ff ff ff       	jmp    10378b <vprintfmt+0x63>

00103840 <.L29>:

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  103840:	83 45 d0 01          	addl   $0x1,-0x30(%ebp)
            goto reswitch;
  103844:	e9 42 ff ff ff       	jmp    10378b <vprintfmt+0x63>

00103849 <.L32>:

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  103849:	8b 45 14             	mov    0x14(%ebp),%eax
  10384c:	8d 50 04             	lea    0x4(%eax),%edx
  10384f:	89 55 14             	mov    %edx,0x14(%ebp)
  103852:	8b 00                	mov    (%eax),%eax
  103854:	83 ec 08             	sub    $0x8,%esp
  103857:	ff 75 0c             	pushl  0xc(%ebp)
  10385a:	50                   	push   %eax
  10385b:	8b 45 08             	mov    0x8(%ebp),%eax
  10385e:	ff d0                	call   *%eax
  103860:	83 c4 10             	add    $0x10,%esp
            break;
  103863:	e9 78 02 00 00       	jmp    103ae0 <.L22+0x28>

00103868 <.L30>:

        // error message
        case 'e':
            err = va_arg(ap, int);
  103868:	8b 45 14             	mov    0x14(%ebp),%eax
  10386b:	8d 50 04             	lea    0x4(%eax),%edx
  10386e:	89 55 14             	mov    %edx,0x14(%ebp)
  103871:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  103873:	85 db                	test   %ebx,%ebx
  103875:	79 02                	jns    103879 <.L30+0x11>
                err = -err;
  103877:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  103879:	83 fb 06             	cmp    $0x6,%ebx
  10387c:	7f 0b                	jg     103889 <.L30+0x21>
  10387e:	8b b4 9f 40 01 00 00 	mov    0x140(%edi,%ebx,4),%esi
  103885:	85 f6                	test   %esi,%esi
  103887:	75 1b                	jne    1038a4 <.L30+0x3c>
                printfmt(putch, putdat, "error %d", err);
  103889:	53                   	push   %ebx
  10388a:	8d 87 7f 39 ff ff    	lea    -0xc681(%edi),%eax
  103890:	50                   	push   %eax
  103891:	ff 75 0c             	pushl  0xc(%ebp)
  103894:	ff 75 08             	pushl  0x8(%ebp)
  103897:	e8 5a fe ff ff       	call   1036f6 <printfmt>
  10389c:	83 c4 10             	add    $0x10,%esp
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  10389f:	e9 3c 02 00 00       	jmp    103ae0 <.L22+0x28>
                printfmt(putch, putdat, "%s", p);
  1038a4:	56                   	push   %esi
  1038a5:	8d 87 88 39 ff ff    	lea    -0xc678(%edi),%eax
  1038ab:	50                   	push   %eax
  1038ac:	ff 75 0c             	pushl  0xc(%ebp)
  1038af:	ff 75 08             	pushl  0x8(%ebp)
  1038b2:	e8 3f fe ff ff       	call   1036f6 <printfmt>
  1038b7:	83 c4 10             	add    $0x10,%esp
            break;
  1038ba:	e9 21 02 00 00       	jmp    103ae0 <.L22+0x28>

001038bf <.L26>:

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  1038bf:	8b 45 14             	mov    0x14(%ebp),%eax
  1038c2:	8d 50 04             	lea    0x4(%eax),%edx
  1038c5:	89 55 14             	mov    %edx,0x14(%ebp)
  1038c8:	8b 30                	mov    (%eax),%esi
  1038ca:	85 f6                	test   %esi,%esi
  1038cc:	75 06                	jne    1038d4 <.L26+0x15>
                p = "(null)";
  1038ce:	8d b7 8b 39 ff ff    	lea    -0xc675(%edi),%esi
            }
            if (width > 0 && padc != '-') {
  1038d4:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  1038d8:	7e 78                	jle    103952 <.L26+0x93>
  1038da:	80 7d cb 2d          	cmpb   $0x2d,-0x35(%ebp)
  1038de:	74 72                	je     103952 <.L26+0x93>
                for (width -= strnlen(p, precision); width > 0; width --) {
  1038e0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1038e3:	83 ec 08             	sub    $0x8,%esp
  1038e6:	50                   	push   %eax
  1038e7:	56                   	push   %esi
  1038e8:	89 fb                	mov    %edi,%ebx
  1038ea:	e8 1b f7 ff ff       	call   10300a <strnlen>
  1038ef:	83 c4 10             	add    $0x10,%esp
  1038f2:	8b 55 d8             	mov    -0x28(%ebp),%edx
  1038f5:	29 c2                	sub    %eax,%edx
  1038f7:	89 d0                	mov    %edx,%eax
  1038f9:	89 45 d8             	mov    %eax,-0x28(%ebp)
  1038fc:	eb 17                	jmp    103915 <.L26+0x56>
                    putch(padc, putdat);
  1038fe:	0f be 45 cb          	movsbl -0x35(%ebp),%eax
  103902:	83 ec 08             	sub    $0x8,%esp
  103905:	ff 75 0c             	pushl  0xc(%ebp)
  103908:	50                   	push   %eax
  103909:	8b 45 08             	mov    0x8(%ebp),%eax
  10390c:	ff d0                	call   *%eax
  10390e:	83 c4 10             	add    $0x10,%esp
                for (width -= strnlen(p, precision); width > 0; width --) {
  103911:	83 6d d8 01          	subl   $0x1,-0x28(%ebp)
  103915:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  103919:	7f e3                	jg     1038fe <.L26+0x3f>
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  10391b:	eb 35                	jmp    103952 <.L26+0x93>
                if (altflag && (ch < ' ' || ch > '~')) {
  10391d:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
  103921:	74 1c                	je     10393f <.L26+0x80>
  103923:	83 fb 1f             	cmp    $0x1f,%ebx
  103926:	7e 05                	jle    10392d <.L26+0x6e>
  103928:	83 fb 7e             	cmp    $0x7e,%ebx
  10392b:	7e 12                	jle    10393f <.L26+0x80>
                    putch('?', putdat);
  10392d:	83 ec 08             	sub    $0x8,%esp
  103930:	ff 75 0c             	pushl  0xc(%ebp)
  103933:	6a 3f                	push   $0x3f
  103935:	8b 45 08             	mov    0x8(%ebp),%eax
  103938:	ff d0                	call   *%eax
  10393a:	83 c4 10             	add    $0x10,%esp
  10393d:	eb 0f                	jmp    10394e <.L26+0x8f>
                }
                else {
                    putch(ch, putdat);
  10393f:	83 ec 08             	sub    $0x8,%esp
  103942:	ff 75 0c             	pushl  0xc(%ebp)
  103945:	53                   	push   %ebx
  103946:	8b 45 08             	mov    0x8(%ebp),%eax
  103949:	ff d0                	call   *%eax
  10394b:	83 c4 10             	add    $0x10,%esp
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  10394e:	83 6d d8 01          	subl   $0x1,-0x28(%ebp)
  103952:	89 f0                	mov    %esi,%eax
  103954:	8d 70 01             	lea    0x1(%eax),%esi
  103957:	0f b6 00             	movzbl (%eax),%eax
  10395a:	0f be d8             	movsbl %al,%ebx
  10395d:	85 db                	test   %ebx,%ebx
  10395f:	74 26                	je     103987 <.L26+0xc8>
  103961:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  103965:	78 b6                	js     10391d <.L26+0x5e>
  103967:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
  10396b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  10396f:	79 ac                	jns    10391d <.L26+0x5e>
                }
            }
            for (; width > 0; width --) {
  103971:	eb 14                	jmp    103987 <.L26+0xc8>
                putch(' ', putdat);
  103973:	83 ec 08             	sub    $0x8,%esp
  103976:	ff 75 0c             	pushl  0xc(%ebp)
  103979:	6a 20                	push   $0x20
  10397b:	8b 45 08             	mov    0x8(%ebp),%eax
  10397e:	ff d0                	call   *%eax
  103980:	83 c4 10             	add    $0x10,%esp
            for (; width > 0; width --) {
  103983:	83 6d d8 01          	subl   $0x1,-0x28(%ebp)
  103987:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  10398b:	7f e6                	jg     103973 <.L26+0xb4>
            }
            break;
  10398d:	e9 4e 01 00 00       	jmp    103ae0 <.L22+0x28>

00103992 <.L31>:

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  103992:	83 ec 08             	sub    $0x8,%esp
  103995:	ff 75 d0             	pushl  -0x30(%ebp)
  103998:	8d 45 14             	lea    0x14(%ebp),%eax
  10399b:	50                   	push   %eax
  10399c:	e8 00 fd ff ff       	call   1036a1 <getint>
  1039a1:	83 c4 10             	add    $0x10,%esp
  1039a4:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1039a7:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            if ((long long)num < 0) {
  1039aa:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1039ad:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1039b0:	85 d2                	test   %edx,%edx
  1039b2:	79 23                	jns    1039d7 <.L31+0x45>
                putch('-', putdat);
  1039b4:	83 ec 08             	sub    $0x8,%esp
  1039b7:	ff 75 0c             	pushl  0xc(%ebp)
  1039ba:	6a 2d                	push   $0x2d
  1039bc:	8b 45 08             	mov    0x8(%ebp),%eax
  1039bf:	ff d0                	call   *%eax
  1039c1:	83 c4 10             	add    $0x10,%esp
                num = -(long long)num;
  1039c4:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1039c7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1039ca:	f7 d8                	neg    %eax
  1039cc:	83 d2 00             	adc    $0x0,%edx
  1039cf:	f7 da                	neg    %edx
  1039d1:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1039d4:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            }
            base = 10;
  1039d7:	c7 45 dc 0a 00 00 00 	movl   $0xa,-0x24(%ebp)
            goto number;
  1039de:	e9 9f 00 00 00       	jmp    103a82 <.L23+0x1f>

001039e3 <.L25>:

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  1039e3:	83 ec 08             	sub    $0x8,%esp
  1039e6:	ff 75 d0             	pushl  -0x30(%ebp)
  1039e9:	8d 45 14             	lea    0x14(%ebp),%eax
  1039ec:	50                   	push   %eax
  1039ed:	e8 52 fc ff ff       	call   103644 <getuint>
  1039f2:	83 c4 10             	add    $0x10,%esp
  1039f5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1039f8:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            base = 10;
  1039fb:	c7 45 dc 0a 00 00 00 	movl   $0xa,-0x24(%ebp)
            goto number;
  103a02:	eb 7e                	jmp    103a82 <.L23+0x1f>

00103a04 <.L28>:

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  103a04:	83 ec 08             	sub    $0x8,%esp
  103a07:	ff 75 d0             	pushl  -0x30(%ebp)
  103a0a:	8d 45 14             	lea    0x14(%ebp),%eax
  103a0d:	50                   	push   %eax
  103a0e:	e8 31 fc ff ff       	call   103644 <getuint>
  103a13:	83 c4 10             	add    $0x10,%esp
  103a16:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103a19:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            base = 8;
  103a1c:	c7 45 dc 08 00 00 00 	movl   $0x8,-0x24(%ebp)
            goto number;
  103a23:	eb 5d                	jmp    103a82 <.L23+0x1f>

00103a25 <.L27>:

        // pointer
        case 'p':
            putch('0', putdat);
  103a25:	83 ec 08             	sub    $0x8,%esp
  103a28:	ff 75 0c             	pushl  0xc(%ebp)
  103a2b:	6a 30                	push   $0x30
  103a2d:	8b 45 08             	mov    0x8(%ebp),%eax
  103a30:	ff d0                	call   *%eax
  103a32:	83 c4 10             	add    $0x10,%esp
            putch('x', putdat);
  103a35:	83 ec 08             	sub    $0x8,%esp
  103a38:	ff 75 0c             	pushl  0xc(%ebp)
  103a3b:	6a 78                	push   $0x78
  103a3d:	8b 45 08             	mov    0x8(%ebp),%eax
  103a40:	ff d0                	call   *%eax
  103a42:	83 c4 10             	add    $0x10,%esp
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  103a45:	8b 45 14             	mov    0x14(%ebp),%eax
  103a48:	8d 50 04             	lea    0x4(%eax),%edx
  103a4b:	89 55 14             	mov    %edx,0x14(%ebp)
  103a4e:	8b 00                	mov    (%eax),%eax
  103a50:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103a53:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
            base = 16;
  103a5a:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
            goto number;
  103a61:	eb 1f                	jmp    103a82 <.L23+0x1f>

00103a63 <.L23>:

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  103a63:	83 ec 08             	sub    $0x8,%esp
  103a66:	ff 75 d0             	pushl  -0x30(%ebp)
  103a69:	8d 45 14             	lea    0x14(%ebp),%eax
  103a6c:	50                   	push   %eax
  103a6d:	e8 d2 fb ff ff       	call   103644 <getuint>
  103a72:	83 c4 10             	add    $0x10,%esp
  103a75:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103a78:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            base = 16;
  103a7b:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  103a82:	0f be 55 cb          	movsbl -0x35(%ebp),%edx
  103a86:	8b 45 dc             	mov    -0x24(%ebp),%eax
  103a89:	83 ec 04             	sub    $0x4,%esp
  103a8c:	52                   	push   %edx
  103a8d:	ff 75 d8             	pushl  -0x28(%ebp)
  103a90:	50                   	push   %eax
  103a91:	ff 75 e4             	pushl  -0x1c(%ebp)
  103a94:	ff 75 e0             	pushl  -0x20(%ebp)
  103a97:	ff 75 0c             	pushl  0xc(%ebp)
  103a9a:	ff 75 08             	pushl  0x8(%ebp)
  103a9d:	e8 a0 fa ff ff       	call   103542 <printnum>
  103aa2:	83 c4 20             	add    $0x20,%esp
            break;
  103aa5:	eb 39                	jmp    103ae0 <.L22+0x28>

00103aa7 <.L38>:

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  103aa7:	83 ec 08             	sub    $0x8,%esp
  103aaa:	ff 75 0c             	pushl  0xc(%ebp)
  103aad:	53                   	push   %ebx
  103aae:	8b 45 08             	mov    0x8(%ebp),%eax
  103ab1:	ff d0                	call   *%eax
  103ab3:	83 c4 10             	add    $0x10,%esp
            break;
  103ab6:	eb 28                	jmp    103ae0 <.L22+0x28>

00103ab8 <.L22>:

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  103ab8:	83 ec 08             	sub    $0x8,%esp
  103abb:	ff 75 0c             	pushl  0xc(%ebp)
  103abe:	6a 25                	push   $0x25
  103ac0:	8b 45 08             	mov    0x8(%ebp),%eax
  103ac3:	ff d0                	call   *%eax
  103ac5:	83 c4 10             	add    $0x10,%esp
            for (fmt --; fmt[-1] != '%'; fmt --)
  103ac8:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  103acc:	eb 04                	jmp    103ad2 <.L22+0x1a>
  103ace:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  103ad2:	8b 45 10             	mov    0x10(%ebp),%eax
  103ad5:	83 e8 01             	sub    $0x1,%eax
  103ad8:	0f b6 00             	movzbl (%eax),%eax
  103adb:	3c 25                	cmp    $0x25,%al
  103add:	75 ef                	jne    103ace <.L22+0x16>
                /* do nothing */;
            break;
  103adf:	90                   	nop
    while (1) {
  103ae0:	e9 5b fc ff ff       	jmp    103740 <vprintfmt+0x18>
                return;
  103ae5:	90                   	nop
        }
    }
}
  103ae6:	8d 65 f4             	lea    -0xc(%ebp),%esp
  103ae9:	5b                   	pop    %ebx
  103aea:	5e                   	pop    %esi
  103aeb:	5f                   	pop    %edi
  103aec:	5d                   	pop    %ebp
  103aed:	c3                   	ret    

00103aee <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  103aee:	f3 0f 1e fb          	endbr32 
  103af2:	55                   	push   %ebp
  103af3:	89 e5                	mov    %esp,%ebp
  103af5:	e8 b5 c7 ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  103afa:	05 56 ce 00 00       	add    $0xce56,%eax
    b->cnt ++;
  103aff:	8b 45 0c             	mov    0xc(%ebp),%eax
  103b02:	8b 40 08             	mov    0x8(%eax),%eax
  103b05:	8d 50 01             	lea    0x1(%eax),%edx
  103b08:	8b 45 0c             	mov    0xc(%ebp),%eax
  103b0b:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  103b0e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103b11:	8b 10                	mov    (%eax),%edx
  103b13:	8b 45 0c             	mov    0xc(%ebp),%eax
  103b16:	8b 40 04             	mov    0x4(%eax),%eax
  103b19:	39 c2                	cmp    %eax,%edx
  103b1b:	73 12                	jae    103b2f <sprintputch+0x41>
        *b->buf ++ = ch;
  103b1d:	8b 45 0c             	mov    0xc(%ebp),%eax
  103b20:	8b 00                	mov    (%eax),%eax
  103b22:	8d 48 01             	lea    0x1(%eax),%ecx
  103b25:	8b 55 0c             	mov    0xc(%ebp),%edx
  103b28:	89 0a                	mov    %ecx,(%edx)
  103b2a:	8b 55 08             	mov    0x8(%ebp),%edx
  103b2d:	88 10                	mov    %dl,(%eax)
    }
}
  103b2f:	90                   	nop
  103b30:	5d                   	pop    %ebp
  103b31:	c3                   	ret    

00103b32 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  103b32:	f3 0f 1e fb          	endbr32 
  103b36:	55                   	push   %ebp
  103b37:	89 e5                	mov    %esp,%ebp
  103b39:	83 ec 18             	sub    $0x18,%esp
  103b3c:	e8 6e c7 ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  103b41:	05 0f ce 00 00       	add    $0xce0f,%eax
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  103b46:	8d 45 14             	lea    0x14(%ebp),%eax
  103b49:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  103b4c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103b4f:	50                   	push   %eax
  103b50:	ff 75 10             	pushl  0x10(%ebp)
  103b53:	ff 75 0c             	pushl  0xc(%ebp)
  103b56:	ff 75 08             	pushl  0x8(%ebp)
  103b59:	e8 0b 00 00 00       	call   103b69 <vsnprintf>
  103b5e:	83 c4 10             	add    $0x10,%esp
  103b61:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  103b64:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103b67:	c9                   	leave  
  103b68:	c3                   	ret    

00103b69 <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  103b69:	f3 0f 1e fb          	endbr32 
  103b6d:	55                   	push   %ebp
  103b6e:	89 e5                	mov    %esp,%ebp
  103b70:	83 ec 18             	sub    $0x18,%esp
  103b73:	e8 37 c7 ff ff       	call   1002af <__x86.get_pc_thunk.ax>
  103b78:	05 d8 cd 00 00       	add    $0xcdd8,%eax
    struct sprintbuf b = {str, str + size - 1, 0};
  103b7d:	8b 55 08             	mov    0x8(%ebp),%edx
  103b80:	89 55 ec             	mov    %edx,-0x14(%ebp)
  103b83:	8b 55 0c             	mov    0xc(%ebp),%edx
  103b86:	8d 4a ff             	lea    -0x1(%edx),%ecx
  103b89:	8b 55 08             	mov    0x8(%ebp),%edx
  103b8c:	01 ca                	add    %ecx,%edx
  103b8e:	89 55 f0             	mov    %edx,-0x10(%ebp)
  103b91:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  103b98:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  103b9c:	74 0a                	je     103ba8 <vsnprintf+0x3f>
  103b9e:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  103ba1:	8b 55 f0             	mov    -0x10(%ebp),%edx
  103ba4:	39 d1                	cmp    %edx,%ecx
  103ba6:	76 07                	jbe    103baf <vsnprintf+0x46>
        return -E_INVAL;
  103ba8:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  103bad:	eb 22                	jmp    103bd1 <vsnprintf+0x68>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  103baf:	ff 75 14             	pushl  0x14(%ebp)
  103bb2:	ff 75 10             	pushl  0x10(%ebp)
  103bb5:	8d 55 ec             	lea    -0x14(%ebp),%edx
  103bb8:	52                   	push   %edx
  103bb9:	8d 80 9e 31 ff ff    	lea    -0xce62(%eax),%eax
  103bbf:	50                   	push   %eax
  103bc0:	e8 63 fb ff ff       	call   103728 <vprintfmt>
  103bc5:	83 c4 10             	add    $0x10,%esp
    // null terminate the buffer
    *b.buf = '\0';
  103bc8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103bcb:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  103bce:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103bd1:	c9                   	leave  
  103bd2:	c3                   	ret    

00103bd3 <__x86.get_pc_thunk.di>:
  103bd3:	8b 3c 24             	mov    (%esp),%edi
  103bd6:	c3                   	ret    
