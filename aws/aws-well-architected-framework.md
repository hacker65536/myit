# AWS Well-Architected Framework

https://d1.awsstatic.com/whitepapers/architecture/AWS_Well-Architected_Framework.pdf

# Introduction

The AWS Well-Architected Framework helps you understand the pros and cons of decisions you make while building systems on AWS. By using the Framework you will learn architectural best practices for designing and operating reliable, secure, efficient, and cost-effective systems in the cloud. It provides a way for you to consistently measure your architectures aginst best practices and identify areas for improvement. The process for reiewing an architecture is a constructive converasation about architectural decisions, and is not an audit mechanism. We believe that having well-architected systems greatly increases the likelihood of business success.

AWS Solutions Architects have years of experience architecting solutions across a wide variety of business verticals and use cases. We have helped design and review thousands of customers' architectures on AWS. From this experience, we have identified best practices and core strategies for architecting systems in the cloud.

The AWS well-Architected Framework documents a set of foundational questions that allow you to understand if a specific architecture aligns well with cloud best practices. The framework provides a consistent approach to evaluating systems aginst the qualities you expect from modern cloud-based systems, and the remediation that would be required to achieve those qualities. As AWS continues to evolve, and we continue to learn more from working with our customers, we will continue to refine the definition of well-architectd.

This framework is intended for those in technology roles, such as chief technology officers(CTOs), architects, developers, and operations team members. It describes AWS best practices and strategies to use when desgning and operating a cloud workload, and provides links to further implementation details and architectural patterns. For more inforamtion, see the [AWS Well-Architected homepage](https://aws.amazon.com/architecture/well-architected/?ref=wellarchitected-wp).

AWS also provides a service for reviewing your workloads at no charge. The [AWS Well-Architected Tool](https://aws.amazon.com/well-architected-tool/?ref=wellarchitected-wp) (AWS WA Tool) is a service in the cloud that provides a consistent process for you to review and measure your architecture using the AWS Well-Architected Framework. The AWS WA Tool provides recommendations for making your workloads more reliable, secure, efficient, and cost-effective.

To help you apply best practices, we have created [AWS Well-Architected Labs](https://wellarchitectedlabs.com/?ref=wellarchitected-wp), which provides you with a repository of code and documentation to give you hands-on experience implementing best practices. We also have teamd up with select AWS Partner Network (APN) Partners, who are members of the [AWS Well-Architected Partner program](https://aws.amazon.com/architecture/well-architected/partners/?ref=wellarchitected-wp). These APN Partners have deep AWS knowledge, and can help you review and improve your workloads.

# Definitions

Every day experts at AWS assist customers in architecting systems to take advantage of best proctices in the cloud. We work with you on making architectural trade-offs as your designs evolve. As you deploy these systems into live environments, we learn how well these systems perform and the consequences of those trade-offs.

Based on what we have learned we have created the AWS Well-Architected Framework, which provides a consistent set of best practices for customers and partners to evaluate architectures, and provides a set of questions you can use to evaluate how well an architecture is aligned to AWS best practices.

The AWS Well-Architectd Framework is based on five piilars -- operational excellence, secuirty, reliability, performance efficiency, and cost optimaization.

**Table 1. The pillars of the AWS Well-Architected Framework**

| Name                   | Description                                                                                                                                                                                                            |
| ---------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Operational Excellence | The ability to run and monitor systems to deliver business value and to continually improve supporting processes and procedures.                                                                                       |
| Security               | The ability to protect information, systems, and assets while delivering business value through risk assessments and mitigation strategies.                                                                            |
| Reliability            | The ability of a system to recover from infrastructure or service disruptions, dynamically acquire computing resources to meet demand, and mitigate disruptions such as misconfigurations or transient network issues. |
| Performance Efficiency | The ability to use computing resources efficiently to meet system requirements, and to maintain that efficiency as demand changes and technologies evolve.                                                             |
| Cost Optimization      | The ability to run systems to deliver business value at the lowest price point.                                                                                                                                        |

In the AWS Well-Architected Framework we use these terms

- A **component** is the code, configuration and AWS Resources that together deliver against a requirement. A component is often the unit of technical ownership, and is decoupled from other components.

- We use the term **workload** to identify a set of components that together deliver business value. The workload is usually the level of detail that business and technology leaders communicate about.
