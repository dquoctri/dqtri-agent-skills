What is Prompt?
PROMPT="Toàn bộ chuỗi text bạn gửi vào model" (không chỉ riêng câu hỏi - mà là mọi text bạn đưa vào)
4 thành phần cột lõi
Instruction: Chỉ dẫn nhiệm vụ
Context: Bối cảnh nền
Input Data: Dữ liệu đầu vào
Output Format: Định dạng đầu ra
3 thành phần phụ
Role: Vai tro (giáo viên, kỹ sư...)
Examples: ví dụ mẫu (few-shot)
Constraints: Ràng buộc (độ dài, tone)
System vs User Prompt
System prompt: Hướng dẫn toàn cục "Hiến pháp" - ít thay đổi
User prompt: Nhiệm vụ mỗi lần chat " "Luật" - cụ thể từng turn
Ví dụ
Prompt mơ hồ vs. cụ thể
Mơ hồ: Tóm tắt văn bản này
Role?
Audiance?
Length?
Format?

Đầy đủ: Bạn là giáo viên cấp 3. Tốm tắt văn đoạn văn bản trong 2-5 câu, ngôn ngữ đơn giản cho học sin. 1 đoạn ngắn, dể hiểu
Role: giáo viên cấp 3
Audience: học sinh
Length: 3-5 câu
format: một đoạn ngắn

Cùng một Model
Prompt 1: kết quả như xổ số
Prompt 2: dùng được ngay


Prompt Engineering
ĐỊNH NGHĨA
Thiết kế và tinh chỉnh prompt để model trả lời chính xác nhất có thể.
1
BE SPECIFIC
Nói rõ format & độ dài
Xác định audience
Tránh từ mơ hồ
FEW-SHOT
2-5 vi du maิน
Pattern matching
Thay lý thuyết trừu tượng
"show, don't tell"
Model học từ ví dụ cụ thể tốt hơn mô tả trừu tượng.


Context là gì?
Context = toàn bộ thông tin model nhìn thay

[ Context Window ]

. System prompt

. User messages

. Assistant messages

. Tool definitions

. Tool results

. RAG documents

. Memory / history

. File contents

Context quá tải
Agent có thể quên hoặc lạc để

Context Window
Token usage

200K 1M token

Độ chính xác

Càng dài -+ độ chính xác giảm, giá tăng

Prompt
Phần bạn gõ

Context
Mọi thứ model thấy

Bạn "fix bug" = một dòng nhỏ xíu
nối trên một biển context khổng lồ

Context Engineering

"Nghệ thuật điền context window với đúng thông tin cho bước
tiếp theo, không hơn không kém."
- Andrej Karpathy

Prompt Eng: Tổi ưu cách bạn nói
Context Eng: Tối ưu những gì model thấy

Agent failure thuờng là context failure
Context tích lũy qua nhiều bước -+ phình to và lạc để

Context Engineering

01 System Prompt Goldilocks
Đủ chi tiết để hướng dẫn, không dài đến mức model lạc. Tập trung high-leverage info.

02 Just-in-Time Loading
Giữ identifier (path, query). Dùng tool fetch on-demand thay vì nhồi hết từ đầu.

03 Compaction & Summarization
Tom tắt history khi context dài. Sub-agent xử lý focused rồi tra về summary.

Ví dụ 1: System prompt cân bằng
Quá ngắn
"You are a helpful assistant"
- Agent không biết quy ước dự an

Vừa đủ
Nen tang + hướng dẫn tool + 2-3 quy ước cot loi
-+ Đủ cụ thể, đủ linh hoạt

Quá dài
5 000 từ Liệt kê mọi edge case
-+ Model lạc, tổn token, vi phạm rule chính

| Ví dụ 2: Just-in-time loading

X Naive

500K token
Paste toàn bộ codebase

I Kết quả đo được

-46.9%
Token mỗi lượt
Cursor A/B test

Claude Code
src/auth/login.ts
- Read("Login.ts")
+ Grep("token")
Chỉ đọc khi cần

+36 điểm
Benchmark agent
42% -+ 78% (Opus 4.5)


Harness là gì?

AGENT
MODEL Bộ não
HARNESS Tay & mắt

Harness giúp model hành động được trong thế giới thực


7 thành phần của Harness

Agent loop
ReAct cycle

Permission
Safety & audit

Sandbox
Isolated exec

Verification
Guardrails

Tool registry
JSON schema

Context mgmt
Compaction

Memory
Working / long-term

Claude Sonnet - cùng một model

4 4 harnesses khác nhau

Claude Code

CLI

Cursor
IDE

Cline

CLI

Aider

Pair-prog

UX khác nhau vì harness khác nhau - không phải model

Cùng model - kết quả khác xa
Một con số đáng để bạn ghi nhớ.
CLAUDE OPUS 4.5 - CÙNG MODEL

+36 78%
ĐIỂM
chi thay harnes
42%

ch

Generic CORE
harness mặc định

Claude Code
harness tối ưu

Bottleneck của agent 2026
không phai model - ma là harness

Harness Engineering
Thiết kế & tỉnh chỉnh harness để agent vận hành tối ưu

5 ĐÒN BẦY CHÍNH

Hooks
PreToolUse: lint trước commit

3

Sub-Agents
Cô lập noise - mỗi agent một context

Slash Commands
/test, /ship - gói quy trình lặp lại

5

CLAUDE.md
Durable context- nạp 1 lần, dùng mọi
turn

amt

Slogan dễ nhớ:

IVE SA

+

Tối ưu cái MÁY - chứ không phải tinh chinh bộ não


Ví dụ thực tế
Hai cấu hình thật - ai cũng làm được trong Claude Code

1. PreToolUse Hook - Lint truớc khi commit

Không có hook

agent commit

Có PreToolUse hook

agent commit

code loi lint

CI fail
sửa -+ commit lại

hook chay Lint

lint fail?
- block commit

vòng Lặp

agent sửa ngay

commit sạch


2. Sub-agent Code-Reviewer
Co sub-agent

spawn sub-agent
conleat rieng

+

output nhli vao context

context phinh

dọc diff
contaxt rang

804

agent lac

tri sumary ngin

context chinh sạch

Workflow sąch hơn. Agent tập trung hơn.
Không phụ thuộc vào việc bạn có nhớ nhắc hay không.


3 CẤP ĐỘ TỐI ƯU AGENT
Harness
Engineering
Cái máy
bao quanh model

Prompt
Engineering
Cách bạn nói
với model

Context
Engineering
Những gi
model thẩy

1

Năm 2026: bottleneck thật sự nằm ở
harness, không phải model







Prompt Engineering Guide Sponsored by SerpAPI
Prompt engineering is a relatively new discipline for developing and optimizing prompts to efficiently use language models (LMs) for a wide variety of applications and research topics. Prompt engineering skills help to better understand the capabilities and limitations of large language models (LLMs).

Researchers use prompt engineering to improve the capacity of LLMs on a wide range of common and complex tasks such as question answering and arithmetic reasoning. Developers use prompt engineering to design robust and effective prompting techniques that interface with LLMs and other tools.

Prompt engineering is not just about designing and developing prompts. It encompasses a wide range of skills and techniques that are useful for interacting and developing with LLMs. It's an important skill to interface, build with, and understand capabilities of LLMs. You can use prompt engineering to improve safety of LLMs and build new capabilities like augmenting LLMs with domain knowledge and external tools.

Motivated by the high interest in developing with LLMs, we have created this new prompt engineering guide that contains all the latest papers, advanced prompting techniques, learning guides, model-specific prompting guides, lectures, references, new LLM capabilities, and tools related to prompt engineering.
