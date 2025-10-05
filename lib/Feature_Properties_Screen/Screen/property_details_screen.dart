// lib/Feature_Properties_Screen/Screens/property_details_screen.dart
import 'package:darkom/App_Theme/app_colors.dart';
import 'package:darkom/App_Theme/app_text.dart';
import 'package:darkom/Feature_Properties_Screen/Controller/property_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PropertyDetailsScreen extends StatelessWidget {
  const PropertyDetailsScreen({super.key, required this.property});

  final PropertyItem property;

  // Shared rounded corners (3-corner style used across cards)
  static const _r = Radius.circular(12);
  static const _threeCorners = BorderRadius.only(
    topLeft: _r,
    bottomLeft: _r,
    bottomRight: _r,
  );

  // Panels visibility (based on status)
  bool get _showTenantPanel =>
      property.status == PropertyStatus.lateExit ||
      property.status == PropertyStatus.notAvailable;
  bool get _showEvictionPanel => property.status == PropertyStatus.lateExit;

  @override
  Widget build(BuildContext context) {
    final pos = LatLng(property.lat, property.lng);

    return Directionality( // force full RTL layout
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),

        // AppBar: default back (no extra arrow)
        appBar: AppBar(
          backgroundColor: const Color(0xFF121212),
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: false,
          title: Text(property.title, style: const TextStyle(color: Colors.white)),
        ),

        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // ---------- Header (ONE ROW: title right, price left) ----------
                Row(
                  textDirection: TextDirection.rtl, // lay out from right to left
                  children: [
                    // Title on the right (Heading5)
                    Flexible(
                      child: Text(
                        '${property.title} - ${property.district}',
                        style: AppText.heading5,
                        textAlign: TextAlign.right,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Spacer(),
                    // Price on the left (Paragraph + dark300)
                    Text(
                      property.price,
                      style: AppText.paragraph.copyWith(color: AppColors.dark300),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                // Small line under header (Paragraph + dark300)
                Text(
                  property.city,
                  style: AppText.paragraph.copyWith(color: AppColors.dark300),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 12),

                // ---------- Main image + lock badge ----------
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: _threeCorners,
                      child: Image.asset(
                        property.image ?? 'assets/images/default_property.png',
                        height: 210,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          height: 210,
                          color: const Color(0xFF1E1E1E),
                          alignment: Alignment.center,
                          child: const Icon(Icons.image, color: Colors.white38, size: 28),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: _tealCircle(const Icon(Icons.lock, color: Colors.white, size: 20)),
                    ),
                  ],
                ),
                const SizedBox(height: 18),

                // ========== Panel 1 ==========
                _PanelCard(
                  number: 1,
                  title: 'معلومات العقار الأساسية',
                  initiallyExpanded: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Status row — label starts at the right
                      Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('الحالة',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                          _StatusChip(text: property.status.label, color: property.status.color),
                        ],
                      ),
                      _divider(),
                      const _InfoRow(
                        title: 'عدد الغرف',
                        value: '٧ غرف (٢ نوم + مجلس + صالة + غرفة غسيل)',
                      ),
                      _divider(),
                      const _InfoRow(title: 'الحمامات', value: '٤ حمامات'),
                      _divider(),
                      const _InfoRow(title: 'المساحة', value: '٤٢٠ م²'),
                      _divider(),
                      const _InfoRow(title: 'نوع العقار', value: 'فيلا'),
                      _divider(),
                      const _InfoRow(title: 'نوع السكن', value: 'عائلي'),
                      const SizedBox(height: 16),

                      // ---- الموقع ----
                      const _SubSectionTitle('الموقع'),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.place, size: 16, color: Colors.white70),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              '${property.city} – ${property.district}، رقم: ${property.title}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.white70),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: _threeCorners,
                        child: SizedBox(
                          height: 190,
                          child: GoogleMap(
                            initialCameraPosition: CameraPosition(target: pos, zoom: 14),
                            markers: {
                              Marker(
                                markerId: const MarkerId('property'),
                                position: pos,
                                infoWindow: InfoWindow(title: property.title),
                              ),
                            },
                            myLocationButtonEnabled: false,
                            zoomControlsEnabled: false,
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // ---- المميزات ----
                      const _SubSectionTitle('المميزات'),
                      const SizedBox(height: 8),
                      const Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _FeaturePill('قريبة من المسجد'),
                          _FeaturePill('قريبة من المترو'),
                          _FeaturePill('إنترنت'),
                          _FeaturePill('مسبح'),
                          _FeaturePill('حديقة خاصة'),
                          _FeaturePill('مواقف خاصة'),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // ---- القواعد والضوابط ----
                      const _SubSectionTitle('القواعد والضوابط'),
                      const SizedBox(height: 8),
                      const _RuleTile(
                        title: 'دليل قواعد السكن',
                        leadingIcon: 'assets/icons/home_rule.png',
                      ),
                      const SizedBox(height: 6),
                      const _RuleTile(
                        title: 'دليل الشروط والأحكام',
                        leadingIcon: 'assets/icons/terms_rule.png',
                      ),

                      // Attachments for lateExit & notAvailable
                      if (_showTenantPanel) ...[
                        const SizedBox(height: 16),
                        const _SubSectionTitle('المرفقات'),
                        const SizedBox(height: 8),
                        _AttachmentPill(
                          text: 'عقد إيجار ${property.title}',
                          onDownload: () {},
                          onDelete: () {},
                        ),
                      ],
                    ],
                  ),
                ),

                // ========== Panel 2 (Tenant) ==========
                if (_showTenantPanel)
                  _PanelCard(
                    number: 2,
                    title: 'معلومات المستأجر',
                    initiallyExpanded: false,
                    child: _TenantCard(
                      name: property.status == PropertyStatus.lateExit
                          ? 'علي الزهراني'
                          : 'منيرة الغامدي',
                      id: property.status == PropertyStatus.lateExit
                          ? '1-199399941'
                          : '129983476',
                      phone: property.status == PropertyStatus.lateExit
                          ? '+966 59XXXXXXX'
                          : '+966 5XXXXXXX',
                      rating: property.status == PropertyStatus.lateExit ? '٣٫٤' : '٣٫٦',
                      startH: '١٦ صفر ١٤٦٧هـ',
                      endH: '١٢ ربيع الأول ١٤٦٧هـ',
                    ),
                  ),

                // ========== Panel 3 (Eviction) ==========
                if (_showEvictionPanel)
                  _PanelCard(
                    number: 3,
                    title: 'الإخلاء',
                    initiallyExpanded: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'يبدو أن المستأجر يرفض الإخلاء.\nبالضغط على "طلب إخلاء" سيتم رفع طلب رسمي لمنصة تأجير لاتمام عملية الإخلاء حسب النظام.',
                          style: TextStyle(color: Colors.white70, height: 1.5),
                          textAlign: TextAlign.right,
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 48,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFCD6D6D),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text('طلب إخلاء',
                                style: TextStyle(color: Colors.white, fontSize: 16)),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Small teal circle on the image
  Widget _tealCircle(Widget child) => Container(
        width: 44,
        height: 44,
        decoration: const BoxDecoration(
          color: Color(0xFF3DBE9A),
          shape: BoxShape.circle,
        ),
        child: Center(child: child),
      );
}

// ---------- Helpers ----------

Widget _divider() => Container(
      height: 1,
      color: const Color(0xFF2A2A2A),
      margin: const EdgeInsets.symmetric(vertical: 8),
    );

class _SubSectionTitle extends StatelessWidget {
  const _SubSectionTitle(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      );
}

// Single info row (title should start from the right)
class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.title, required this.value, super.key});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) => Row(
        textDirection: TextDirection.rtl, // ensure start at right
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.left,
              style: const TextStyle(color: Colors.white70),
            ),
          ),
        ],
      );
}

class _FeaturePill extends StatelessWidget {
  const _FeaturePill(this.label, {super.key});
  final String label;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          border: Border.all(color: const Color(0xFF3E3E3E)),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
      );
}

// Rules row (icon at right, chevron at left; no extra arrow on the far right)
class _RuleTile extends StatelessWidget {
  const _RuleTile({required this.title, required this.leadingIcon, super.key});
  final String title;
  final String leadingIcon;

  static const _r = Radius.circular(10);
  static const _three = BorderRadius.only(
    topLeft: _r,
    bottomLeft: _r,
    bottomRight: _r,
  );

  @override
  Widget build(BuildContext context) => Container(
        height: 48,
        decoration: BoxDecoration(
          color: const Color(0xFF1B1B1B),
          borderRadius: _three,
          border: Border.all(color: const Color(0xFF2A2A2A)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            const Icon(Icons.chevron_left, size: 18, color: Colors.white70),
            const Spacer(),
            Text(title,
                style:
                    const TextStyle(color: Color(0xFF3DBE9A), fontWeight: FontWeight.w600)),
            const SizedBox(width: 10),
            Image.asset(leadingIcon, width: 18, height: 18,
                errorBuilder: (_, __, ___) => const SizedBox()),
          ],
        ),
      );
}

class _AttachmentPill extends StatelessWidget {
  const _AttachmentPill({
    super.key,
    required this.text,
    required this.onDownload,
    required this.onDelete,
  });
  final String text;
  final VoidCallback onDownload;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) => Container(
        height: 46,
        decoration: BoxDecoration(
          color: const Color(0xFF141414),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: const Color(0xFF3DBE9A)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            IconButton(
              onPressed: onDelete,
              icon: const Icon(Icons.delete_outline, color: Colors.white70, size: 20),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            const SizedBox(width: 6),
            IconButton(
              onPressed: onDownload,
              icon: const Icon(Icons.download_rounded, color: Colors.white70, size: 22),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            const Spacer(),
            Flexible(
              child: Text(text,
                  style: const TextStyle(color: Colors.white70),
                  overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      );
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.text, required this.color});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: color.withOpacity(0.15),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: color, width: 1),
        ),
        child: Text(text,
            style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w600)),
      );
}

// Collapsible panel card with a numeric badge (1/2/3)
class _PanelCard extends StatefulWidget {
  const _PanelCard({
    required this.number,
    required this.title,
    required this.child,
    this.initiallyExpanded = false,
  });

  final int number;
  final String title;
  final Widget child;
  final bool initiallyExpanded;

  @override
  State<_PanelCard> createState() => _PanelCardState();
}

class _PanelCardState extends State<_PanelCard> {
  late bool _expanded = widget.initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF252525)),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          collapsedIconColor: Colors.white70,
          iconColor: Colors.white70,
          initiallyExpanded: _expanded,
          onExpansionChanged: (v) => setState(() => _expanded = v),

          // **Title starts from the right** (title then badge)
          title: Row(
            textDirection: TextDirection.rtl,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.title,
                  style:
                      const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
              const SizedBox(width: 8),
              _Badge(number: widget.number),
            ],
          ),

          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: widget.child,
            ),
          ],
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.number});
  final int number;

  @override
  Widget build(BuildContext context) => Container(
        width: 24,
        height: 24,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFF1F3B33),
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: const Color(0xFF3DBE9A)),
        ),
        child: Text('$number',
            style: const TextStyle(
                color: Color(0xFF3DBE9A), fontSize: 12, fontWeight: FontWeight.w700)),
      );
}

// Tenant card (panel 2)
class _TenantCard extends StatelessWidget {
  const _TenantCard({
    required this.name,
    required this.id,
    required this.phone,
    required this.rating,
    required this.startH,
    required this.endH,
    super.key,
  });

  final String name;
  final String id;
  final String phone;
  final String rating;
  final String startH;
  final String endH;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1B1B1B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF2A2A2A)),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundImage:
                    AssetImage('images/HomeScreen/header/avatar.png'),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(name,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700)),
                    Text(id, style: const TextStyle(color: Colors.white70)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF1F3B33),
                  borderRadius: BorderRadius.circular(16),
                ),
                child:
                    Text(rating, style: const TextStyle(color: Color(0xFF3DBE9A))),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _tenantRow(Icons.phone, 'الجوال', phone),
          const SizedBox(height: 8),
          _tenantRow(Icons.event, 'تاريخ بداية العقد', startH),
          const SizedBox(height: 8),
          _tenantRow(Icons.event, 'تاريخ نهاية العقد', endH),
        ],
      ),
    );
  }

  Widget _tenantRow(IconData ic, String label, String value) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: const Color(0xFF141414),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF2A2A2A)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Icon(ic, size: 18, color: Colors.white70),
          const Spacer(),
          Text(value, style: const TextStyle(color: Colors.white70)),
          const SizedBox(width: 8),
          Text(label,
              style:
                  const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
