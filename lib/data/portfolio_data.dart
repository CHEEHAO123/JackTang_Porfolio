import '../models/models.dart';

/// All resume content in one place, sourced from `Tang Sew Peng` resume PDF.
/// Update this file to keep the site in sync with the latest resume.
class PortfolioData {
  PortfolioData._();

  static const String name = 'Tang Sew Peng';
  static const String roleTitle = 'Senior System Analyst';
  static const String tagline =
      'IT infrastructure · Banking systems · Application support · UAT & project coordination';

  static const String phone = '+60 12-236 2207';
  static const String email = 'tangsew@yahoo.com';
  static const String resumeAssetPath = 'assets/resume/Tang_Sew_Peng_Resume.pdf';
  static const String profileImagePath = 'assets/images/profile.png';

  static const String summary =
      'Senior System Analyst with experience across IT infrastructure, banking '
      'systems, application support, project coordination, system '
      'implementation and User Acceptance Testing (UAT).\n\n'
      'Experienced in production support, Linux server administration, Oracle '
      'database maintenance, disaster recovery exercises, system monitoring and '
      'cross-functional coordination. Combines hands-on technical support with '
      'delivery coordination, requirements analysis and stakeholder management.';

  static const String additionalStrengths =
      'Experience supporting Multi-Function Devices (MFD), EPF kiosks, ATMs and '
      'Cash Deposit Machines (CDM). Proactive and independent, with strong '
      'communication skills and the ability to work effectively with business '
      'users, technical teams, vendors and stakeholders at different '
      'organizational levels.';

  static const List<GlanceItem> glance = [
    GlanceItem('Current role', 'Senior System Analyst'),
    GlanceItem('Company', 'Microlink Systems Sdn Bhd'),
    GlanceItem('Domain', 'Banking & enterprise systems'),
    GlanceItem('Career', 'IT since 2008'),
    GlanceItem('Education', 'Degree in Computer Science'),
  ];

  static const List<SkillCategory> skillCategories = [
    SkillCategory(
      title: 'Application Support',
      skills: ['Application Support (L2/BAU)', 'UAT & Defect Management'],
    ),
    SkillCategory(
      title: 'Infrastructure',
      skills: [
        'Linux Administration',
        'IT Infrastructure & VM Provisioning',
        'VMware / Proxmox',
        'Disaster Recovery',
        'System Monitoring & Performance',
      ],
    ),
    SkillCategory(
      title: 'Database',
      skills: ['Oracle Database Support'],
    ),
    SkillCategory(
      title: 'Delivery & Business',
      skills: [
        'Project Coordination',
        'Business Requirements Analysis',
        'Vendor & Stakeholder Management',
      ],
    ),
  ];

  static const List<ExperienceEntry> experience = [
    ExperienceEntry(
      company: 'Microlink Systems Sdn Bhd',
      role: 'Senior System Analyst',
      period: 'Sep 2017 - Present',
      scope:
          'Responsible for IT infrastructure and system support, application '
          'production support, project implementation, database maintenance, '
          'disaster recovery, system monitoring, and technical coordination '
          'for banking and enterprise systems.',
      achievements: [
        Achievement(
          title: 'CFOS Production Go-Live',
          period: 'April 2025',
          description:
              'Successfully supported delivery of the CFOS project through '
              'production go-live and continued with L2 BAU operational support.',
        ),
        Achievement(
          title: 'WhaTap Monitoring POC',
          period: 'May - August 2025',
          description:
              'Led the MBIB monitoring proof of concept to evaluate application '
              'and infrastructure performance monitoring.',
        ),
        Achievement(
          title: 'CBP Full Disaster Recovery Exercises',
          period: 'December 2025 & January 2026',
          description:
              'Coordinated and supported DR exercises, including recovery '
              'activities and system validation.',
        ),
      ],
      responsibilities: [
        ResponsibilityGroup(
          title: 'Application Support & BAU Operations',
          items: [
            'Provide Level 2 (L2) Business-as-Usual (BAU) support for CBP CFOS.',
            'Support production operations and ensure system stability and availability.',
          ],
        ),
        ResponsibilityGroup(
          title: 'IT Infrastructure & System Administration',
          items: [
            'Perform Linux server administration, virtual machine provisioning, application deployment, and infrastructure maintenance.',
            'Monitor server resources, system performance, and infrastructure health.',
            'Support VMware/Proxmox virtualization and infrastructure implementation projects.',
          ],
        ),
        ResponsibilityGroup(
          title: 'Oracle Database Support',
          items: [
            'Coordinate annual Oracle database partition creation and maintenance.',
            'Support database patching activities and coordinate with DBAs on database-related issues.',
            'Assist with system recovery and database operational activities.',
          ],
        ),
        ResponsibilityGroup(
          title: 'Disaster Recovery (DR)',
          items: [
            'Work with application, database, and infrastructure teams to execute recovery activities.',
            'Support system recovery validation and business continuity readiness.',
          ],
        ),
        ResponsibilityGroup(
          title: 'Monitoring & Performance',
          items: [
            'Lead the WhaTap monitoring Proof of Concept (POC) for MBIB.',
            'Support system performance investigation and monitor improvements.',
          ],
        ),
        ResponsibilityGroup(
          title: 'Project Coordination & Documentation',
          items: [
            'Prepare three-year project budget quotations and infrastructure cost estimates.',
            'Prepare Request for Proposal (RFP) documentation for the RCE project.',
            'Coordinate with customers, vendors, developers, DBAs, and infrastructure teams.',
            'Support infrastructure initiatives, including CBP and RHB SIT VM environment setup and Project Gamuda.',
          ],
        ),
      ],
    ),
    ExperienceEntry(
      company: 'AmBank Berhad',
      role: 'Senior Executive I / Senior Executive II',
      period: '2008 - Nov 2016',
      note: 'Promoted to Senior Executive I in 2014',
      scope:
          'Responsible for banking IT infrastructure deployment, project '
          'coordination, business requirements analysis, User Acceptance '
          'Testing (UAT), system implementation, and operational support '
          'across headquarters and regional offices.',
      achievements: [
        Achievement(
          title: 'Career progression',
          description: 'Promoted from Senior Executive II to Senior Executive I in 2014.',
        ),
        Achievement(
          title: 'UAT coordination',
          description:
              'Coordinated end-to-end UAT activities, including test execution, '
              'defect tracking, progress monitoring, and reporting.',
        ),
        Achievement(
          title: 'Banking project implementation',
          description:
              'Supported EPF Kiosk and Mobile EPF Kiosk initiatives, SMS '
              'facilities, and eFax services.',
        ),
        Achievement(
          title: 'Cross-functional collaboration',
          description:
              'Worked with GIS, business users, vendors, and IT teams to support '
              'project implementation and issue resolution.',
        ),
      ],
      responsibilities: [
        ResponsibilityGroup(
          title: 'Project Coordination & Delivery',
          items: [
            'Coordinate IT projects and implementation activities to meet timelines and project requirements.',
            'Support the Section Head in monitoring project progress and delivery.',
            'Liaise with business users, Group Information System (GIS), vendors, and internal IT teams.',
          ],
        ),
        ResponsibilityGroup(
          title: 'User Acceptance Testing (UAT)',
          items: [
            'Coordinate end-to-end UAT activities, including test planning, test-case preparation, execution, defect tracking, and reporting.',
            'Assign testing activities to team members and monitor progress.',
            'Maintain test documentation and coordinate defect resolution.',
            'Conduct user requirement studies and prepare Business Requirements Specifications (BRS).',
          ],
        ),
        ResponsibilityGroup(
          title: 'IT Infrastructure Deployment',
          items: [
            'Manage hardware and software procurement, installation, configuration, and deployment.',
            'Coordinate desktop, laptop, communication facilities, and user readiness.',
          ],
        ),
        ResponsibilityGroup(
          title: 'Banking System Implementation',
          items: [
            'Support implementation of the EPF Kiosk Project and Mobile EPF Kiosk devices.',
            'Coordinate infrastructure delivery for SMS and eFax services supporting Credit Card Sales and Personal Finance divisions.',
            'Coordinate Managed File Transfer (MFT) implementation with AmBank IT.',
          ],
        ),
      ],
    ),
  ];

  static const List<EducationEntry> education = [
    EducationEntry(
      institution: 'FTMS - De Montfort University (Campus Malaysia)',
      credential: 'Degree in Computer Science',
      period: '2001 - 2002',
    ),
    EducationEntry(
      institution: 'FTMS - De Montfort University (Campus Malaysia)',
      credential: 'Higher Diploma in Computer Science',
      period: '1999 - 2001',
    ),
    EducationEntry(
      institution: 'Tunku Abdul Rahman College (TAR College), Kuala Lumpur',
      credential: 'Certificates in DPM and CPIP',
      period: '1994 - 1996',
    ),
    EducationEntry(
      institution: 'Sekolah Menengah Kebangsaan Taman Ehsan',
      credential: 'Sijil Pelajaran Malaysia (SPM)',
      period: '1993',
    ),
  ];

  /// All entries are Certificates of Attendance.
  static const List<DevelopmentEntry> development = [
    DevelopmentEntry(
      year: '2026',
      title: 'Mastering Microsoft Copilot Studio: From Custom Agent Development to M365 Extensibility',
    ),
    DevelopmentEntry(
      year: '2026',
      title: "Redefine What's Possible with Oracle Technology (RWPOT)",
    ),
    DevelopmentEntry(
      year: '2025',
      title: 'AI-Driven Security: Microsoft Identity, Compliance & Cyber Defence',
    ),
    DevelopmentEntry(year: '2025', title: 'Microsoft AI-900: Azure AI Fundamentals'),
    DevelopmentEntry(year: '2024', title: 'Unmasking Cybersecurity and Taking Control'),
    DevelopmentEntry(year: '2024', title: 'AI AWS'),
    DevelopmentEntry(year: '2024', title: 'Microsoft Copilot'),
    DevelopmentEntry(year: '2023', title: 'Microsoft Azure Administrator'),
    DevelopmentEntry(year: '2022', title: 'Implementing and Administering Cisco Solutions v1.0'),
  ];
}
